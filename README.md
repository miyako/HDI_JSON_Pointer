![version](https://img.shields.io/badge/version-20%2B-E23089)
![platform](https://img.shields.io/static/v1?label=platform&message=mac-intel%20|%20mac-arm%20|%20win-64&color=blue)

# HDI_JSON_Pointer

Demonstrates `JSON Resolve pointers`, which walks an object and replaces JSON Pointer `$ref` references with the values they point to. Originally published by 4D as a **HDI** (*How Do I*) example for **4D v16 R5 / v17**; converted from the binary `.4DB` to the `.4DProject` architecture so it runs on current 4D releases.

## What it demonstrates

- Resolving intra-document `$ref` pointers so a value defined once (an address, a colour) can be reused elsewhere in the same object.
- Inspecting the `success` and `errors` fields of the result object returned by `JSON Resolve pointers` and branching on them.
- Duplicating the source object with `OB Copy` before resolving, so the original stays intact for a side-by-side before/after view.
- Resolving pointers to *external* JSON files via the `rootFolder` option, switching the referenced folder (BLACK vs BLUE assets) at runtime.
- Using the `merge` option to patch a settings object against a defaults file, including handling a `delete` directive.
- Loading each sample from `Resources` with `Document to text` / `JSON Parse` and highlighting the resolved keys with styled-text attributes.

## Key commands

| Command | Used for |
|---|---|
| `JSON Resolve pointers` | Resolve `$ref` pointers in-object, with `rootFolder` and `merge` options |
| `JSON Parse` | Parse the sample JSON documents into objects/collections |
| `JSON Stringify` | Render the resolved object back to formatted text for display |
| `OB Copy` | Clone the config object so the source is preserved alongside the result |
| `Document to text` | Read the sample and reference JSON files from the resources folder |
| `New object` | Build the options object (`rootFolder`, `merge`) passed to the resolver |

## How it works

The landing form `HDI` is the standard splash screen: `ObjectMethods/BtnDemo.4dm` opens the demo and `txtBlog.4dm` opens the blog post. The demo itself is the form `HDI2`.

`Forms/HDI2/method.4dm` drives a tab control. On load it calls `initHDI` (which fills the tab titles from `Resources/Samples.json`), and on each page change it loads the relevant sample file into the `oConfig` variable and calls `prettyHDI` to lay out and colourise the panels. Each example page has a "resolve" button whose object method performs the actual work:

- `ObjectMethods/btnResolveExp1.4dm` -- copies `oConfig`, calls `JSON Resolve pointers`, and on `$oResult.success` stringifies the resolved object into `oMyConfig`; otherwise it shows `$oResult.errors`. This is the single most instructive method to read first.
- `ObjectMethods/btnResolveExp2.4dm` -- builds `New object("rootFolder"; $folder)` and resolves pointers against external asset files, with `btnBlackFolder` / `btnBlueFolder` selecting the folder.
- `ObjectMethods/btnResolveExp3.4dm` -- builds `New object("merge"; ...)` to patch `mySettings.json` over `defaultSettings.json`.

`prettyHDI.4dm` is presentation only: it toggles object visibility per page and uses `ST SET ATTRIBUTES` to colour the pointer keys red.

## Points of interest

- `JSON Resolve pointers` mutates the object passed to it in place and returns a status object -- it does not return a new object. That is why every example calls `OB Copy` first.
- Always branch on `$oResult.success`; the failure path exposes a structured `errors` collection rather than throwing.
- The `rootFolder` option lets `$ref` values point at separate files on disk, turning JSON pointers into a lightweight file-composition mechanism.
- The `merge` option performs a patch/merge (including delete semantics) rather than a plain replace, which is easy to miss from the command name alone.

## Modernisation notes

Converted from the binary `.4DB` to a 4D project. The following branch tracks the modernisation work.

| Branch | Description | Guidance |
|--------|-------------|----------|
| [`miyako-hdi-project-modernisation`](../../tree/miyako-hdi-project-modernisation) | Hid subroutine/form-dependent methods from the Run Method dialog, added English/Japanese XLIFF localisation, replaced deprecated `C_*` declarations with `var`/`#DECLARE`, migrated the menu bar and startup dialog to modern patterns, and added Dark Mode/Liquid Glass support. | [`4dmethods`](https://github.com/miyako/skills/tree/main/4d-skills/skills/4dmethods), [`4dlocalise`](https://github.com/miyako/skills/tree/main/4d-skills/skills/4dlocalise), [`4dmodernise`](https://github.com/miyako/skills/tree/main/4d-skills/skills/4dmodernise), [`4dproject`](https://github.com/miyako/skills/tree/main/4d-skills/skills/4dproject), [`4dstartup`](https://github.com/miyako/skills/tree/main/4d-skills/skills/4dstartup), [hdi.startup.instructions.md](.github/instructions/hdi.startup.instructions.md), [`4dcss`](https://github.com/miyako/skills/tree/main/4d-skills/skills/4dcss) |

## References

- [4D blog: Working with JSON Pointers](https://blog.4d.com/working-with-json-pointers/)
- [4D documentation: JSON Resolve pointers](https://developer.4d.com/docs/commands/json-resolve-pointers)
- Original download: [HDI_JSON_Pointer.zip](https://download.4d.com/Demos/4D_v16_R5/HDI_JSON_Pointer.zip)
- Index of v16/v17 HDIs: [miyako/4d-hdi](https://github.com/miyako/4d-hdi)

## Screenshots

<img width="724" height="592" alt="Screenshot 2026-07-24 at 6 30 05" src="https://github.com/user-attachments/assets/04070c2c-6431-47ba-9fbe-38f287225d48" />
<img width="819" height="742" alt="Screenshot 2026-07-24 at 6 21 17" src="https://github.com/user-attachments/assets/78138966-7e91-4329-962e-10f0b0c54cfd" />
<img width="819" height="742" alt="Screenshot 2026-07-24 at 6 21 28" src="https://github.com/user-attachments/assets/9f167702-112f-42df-8cb5-05cbe4564530" />
<img width="819" height="742" alt="Screenshot 2026-07-24 at 6 21 37" src="https://github.com/user-attachments/assets/d0110f00-17d4-4988-8d90-b457184a9a75" />
<img width="819" height="742" alt="Screenshot 2026-07-24 at 6 21 47" src="https://github.com/user-attachments/assets/884deeae-0968-46f8-8993-fe84983895a6" />
