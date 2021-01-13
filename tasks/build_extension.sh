#!/usr/bin/env node

const { mkdir, copyFile: copy_file } = require('fs/promises')
const { join } = require('path')
const { promisify } = require('util')
const exec_file = promisify(require('child_process').execFile)

const [, , ...arguments] = process.argv
const mkdir_options = {
  recursive: true,
}

const build_extension = async () => {
  console.log('build begin')
  const copy_action = Symbol('action_copy_file')
  const mkdir_action = Symbol('action_create_dir')
  const re_arguments = /(?:\s*)(?<key>\S+)(?:\s*)(?:(?<assignment>:)|(?<copy>>))(?:\s*)(?<value>\S+)(?:\s*)|^(?<file_or_folder>.+)$/
  const queue = []
  let package_target = '.'
  let project_path = '.'
  // read project config and prepare build steps queue
  for (arg of arguments) {
    const {
      groups: { key, assignment, copy, value, file_or_folder },
    } = re_arguments.exec(arg)
    if (key === 'package_target') {
      package_target = value
      queue.push({ key, value, action: mkdir_action })
    } else if (key === 'project_path') {
      project_path = value
    } else if (file_or_folder) {
      // treat every other value as file or folder and mark to copy it
      queue.push({ file_or_folder, action: copy_action })
    } else if (assignment) {
        // treat every other assignment as mkdir_action
        // queue.push({key, value, action: mkdir_action})
        queue.push({key, value, action: mkdir_action})
    } else if (copy) {
      queue.push({key, value, action: copy_action})
    } else {
      console.log('this shouldnt be here', arg)
    }
  }
  // execute process step queue
  for (step of queue) {
    switch (step.action) {
      case mkdir_action:
        try {
          await mkdir(step.value, mkdir_options)
        } catch (err) {
          console.error(err)
          process.exit(1)
        }
        break
      case copy_action:
        try {
          await copy_file(
            join(project_path, step.file_or_folder || step.key),
            join(project_path, package_target, step.file_or_folder || step.value)
          )
        } catch (err) {
          console.error(err)
          process.exit(1)
        }
        break
    }
  }
  console.log('build end')
}

const compile_polis_theme = async () => {
  const child = await exec_file('yarn', ['build'], async (err, stdout, stderr) => {
    if (err) {
      console.error(stdout)
      process.exit(err.code || 1)
    }
    await build_extension()
    console.log(stdout)
  })
}
compile_polis_theme()
