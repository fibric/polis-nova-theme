# Polis v0.2.0

## Built-in languages

### JavaScript since v0.2.0
![Polis JavaScript][polis_javascript]

### JSON since v0.2.0
![Polis JSON][polis_json]

## Contribute

Within this project, two custom tasks are available. `Prepare Environment` and `Polis Theme`.

![Custom Task overview][custom_task_overview]

`Prepare Environment` has a `Build` target that you must run before contributing — executing the `Clean` target checks if node and yarn are installed and installs stylus.

`Polis Theme` also consists of a `Build` target and additionally `Run` and `Clean`. `Build` triggers `stylus` to convert all `.styl` files to CSS starting from `index.styl` file.

`Run` triggers a `node` script that copies all theme relevant files into `Polis.novaextension` folder. `Clean` removes the `Themes` and `Polis.novaextension` folder.

![Custom Task clean][custom_task_clean]

To enable the theme while modifying it, you must run the `Polis Theme` custom task `Build` target followed by the 'Run' target. Nova reads the `Polis.css` from the 'Themes' folder inside of the `Polis.novaextension` folder.

[polis_javascript]:
https://gitlab.com/fibric/polis-nova-theme/-/raw/main/Images/extension/polis-javascript.png

[polis_json]:
https://gitlab.com/fibric/polis-nova-theme/-/raw/main/Images/extension/polis-json.png

[custom_task_overview]:
https://gitlab.com/fibric/polis-nova-theme/-/raw/main/Images/extension/custom-task-overview.png

[custom_task_clean]:
https://gitlab.com/fibric/polis-nova-theme/-/raw/main/Images/extension/custom-task-clean.gif
