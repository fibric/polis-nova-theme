# Polis v0.3.1

The colors I choose came from the LEDS of my [Denon SC5000M Prime](https://www.denondj.com/sc5000m-prime-sc5000mprimexus) players. Extracting color values from the pictures were done using Eigenlogik's [Spectrum](http://www.eigenlogik.com/spectrum/mac) app.

![Polis Color Inspiration][polis_color_inspiration]

I'm pretty happy with the colors so far but I do like Nova's rainbow colors too. At the moment Nova's rainbow colors do not clash with Polis's color palette.

## Built-in languages

### Markdown since v0.3.0
![Polis Markdown][polis_markdown]

### JavaScript since v0.2.0
![Polis JavaScript][polis_javascript]

### JSON since v0.2.0
![Polis JSON][polis_json]

## Recommended settings

![Nova Editor Editing][nova_editor_editing]

I use the fantastic open-source monospaced font [Victor Mono](https://rubjo.github.io/victor-mono/) `16px` and `1.5` `Line Height`.

The cursor looks okay when set as `Underline` or `Vertical Bar`. Until Nova.app supports `invert()`-CSS I do not recommend using the cursor style `Block`.

I haven't styled `Invisibles` as they are always shown when enabled rather than when selected.

![Nova Editor Syntax][nova_editor_syntax]

Enable `Highlight: Matching brackets and tags` and `Use rainbow brackets` as well as `Instances of symbol cursor`.

![Nova Editor Indentation][nova_editor_indentation]

Enable `Indentation Guides: Rainbow`.

## Contribute

Within this project, two custom tasks are available. `Prepare Environment` and `Polis Theme`.

![Custom Task overview][custom_task_overview]

`Prepare Environment` has a `Build` target that you must run before contributing — executing the `Clean` target checks if node and yarn are installed and installs stylus.

`Polis Theme` also consists of a `Build` target and additionally `Run` and `Clean`. `Build` triggers `stylus` to convert all `.styl` files to CSS starting from `index.styl` file.

`Run` triggers a `node` script that copies all theme relevant files into `Polis.novaextension` folder. `Clean` removes the `Themes` and `Polis.novaextension` folder.

![Custom Task clean][custom_task_clean]

To enable the theme while modifying it, you must run the `Polis Theme` custom task `Build` target followed by the 'Run' target. Nova reads the `Polis.css` from the 'Themes' folder inside of the `Polis.novaextension` folder.

## Known issues (Nova vs Polis)

- Missing CSS `invert()` (Cursor style `Block` unusable with Polis)
- No support for CSS Properties (I choose Stylus to manage colors)
- `Type and function separator` not directly style-able
- CSS selector order does matter despite being described otherwise `even the order does not matter` in the [docs](https://docs.nova.app/extensions/themes/#themes). I got puzzled pretty often when trying to style elements
- Not all CSS selector shown in syntax inspector seem to have an effect. The current workflow is practically just trial-by-error.
- Syntax coloring doesn't work inside markup code blocks
- `text-decoration` strikethrough not supported despite being mentioned in the [docs](https://docs.nova.app/extensions/themes/#styling-syntax-highlighting)
- `text-doceration` `underline` doesn't support `wavy` and sometimes the underline isn't even drawn in the same row.
- `background-color` doesn't work vibrant themes for `meta.button.selected` and `meta.titlebar.inactive`
- `markup-code` has higher specificity than `meta.text.selected` which makes it hard to select text snippets inside of code e.g. Markdown code blocks.

[polis_color_inspiration]: https://gitlab.com/fibric/polis-nova-theme/-/raw/main/Images/extension/polis-color-inspiration.png

[nova_editor_editing]: https://gitlab.com/fibric/polis-nova-theme/-/raw/main/Images/extension/nova-editor-editing.png

[nova_editor_syntax]: https://gitlab.com/fibric/polis-nova-theme/-/raw/main/Images/extension/nova-editor-syntax.png

[nova_editor_Indendation]: https://gitlab.com/fibric/polis-nova-theme/-/raw/main/Images/extension/nova-editor-indentation.png

[polis_markdown]: https://gitlab.com/fibric/polis-nova-theme/-/raw/main/Images/extension/polis-markdown.png

[polis_javascript]: https://gitlab.com/fibric/polis-nova-theme/-/raw/main/Images/extension/polis-javascript.png
[polis_json]: https://gitlab.com/fibric/polis-nova-theme/-/raw/main/Images/extension/polis-json.png

[custom_task_overview]: https://gitlab.com/fibric/polis-nova-theme/-/raw/main/Images/extension/custom-task-overview.png

[custom_task_clean]: https://gitlab.com/fibric/polis-nova-theme/-/raw/main/Images/extension/custom-task-clean.gif
