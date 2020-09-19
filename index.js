import { mkdir, copyFile } from 'fs'
import { sep } from 'path'
import { createRequire } from "module";
const require = createRequire(import.meta.url);
const package_json = require("./package.json");
const theme_name = `${package_json.name}.novaextension`
const files = [
    'CHANGELOG.md',
    'extension.json',
    'extension.png',
    'extension@2x.png',
    'LICENSE.md',
    'README.md',
    'Images/extension/polis-json.png',
    'Themes/Polis.css'
]
// const [,,args] = process.argv
mkdir(['.', theme_name].join(sep), { recursive: true }, (err) => {
    if (err) throw err;
    for (const maybe_file of files) {
        const maybe_path = maybe_file.split(sep)
        if (maybe_path.length > 1) {
            const file = maybe_path.pop()
            const path = ['.', theme_name, maybe_path.join(sep)].join(sep)
            mkdir(path, { recursive: true}, (err) => {
                if (err) throw err;
            })
        }
        copyFile(['.', maybe_file].join(sep), ['.', theme_name, maybe_file].join(sep), (err) => {
            if (err) throw err;
        })
    }
    console.log(`${theme_name} has been created and is ready to test or publish`);
});
