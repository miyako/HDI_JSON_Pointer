# HDI_JSON_Pointer

A 4D v17 **HDI** (How Do I) binary database demonstrating JSON pointers, converted to a 4D project using 4D 21. The codebase was then updated and cleaned up with the help of **GitHub Copilot**.

## Origin

This project started as a binary `.4DB` example database originally distributed with 4D v17. It was converted to the modern project architecture (`.4DProject`) using 4D 21's built-in binary-to-project conversion tool.

- **Blog post:** [Working with JSON Pointers](https://blog.4d.com/working-with-json-pointers/)

- **Original download:** [HDI_JSON_Pointer.zip](https://download.4d.com/Demos/4D_v16_R5/HDI_JSON_Pointer.zip)

## Branches

Each branch represents a distinct modernisation effort, guided by a corresponding Copilot instruction file.

| Branch | Description | Instructions |
|--------|-------------|--------------|
| [`miyako-hdi-project-modernisation`](../../tree/miyako-hdi-project-modernisation) | Hid subroutine/form-dependent methods from the Run Method dialog, added English/Japanese XLIFF localisation, replaced deprecated `C_*` declarations with `var`/`#DECLARE`, migrated the menu bar and startup dialog to modern patterns, and added Dark Mode/Liquid Glass support. | [method.visibility.instructions.md](.github/instructions/method.visibility.instructions.md), [localisation.instructions.md](.github/instructions/localisation.instructions.md), [variable.declarations.instructions.md](.github/instructions/variable.declarations.instructions.md), [menu.instructions.md](.github/instructions/menu.instructions.md), [startup.instructions.md](.github/instructions/startup.instructions.md), [css.instructions.md](.github/instructions/css.instructions.md), [tahoe.css.instructions.md](.github/instructions/tahoe.css.instructions.md) |

## Copilot Token Usage

Actual per-session token usage, pulled from Copilot session records.

| Session | Branch | Model(s) | Input Tokens | Output Tokens | Turns |
|---------|--------|----------|-------------:|--------------:|------:|
| HDI project modernisation | `miyako-hdi-project-modernisation` | Claude Sonnet 5 | 5,988,302 | 47,020 | 41 |
| **Total** | | | **5,988,302** | **47,020** | **41** |

## Screenshots
