# QML → Web Symbology Sync (GitHub Action)

The RiverscapesXML repository automatically converts QGIS `.qml` symbology files into the JSON format used by the [Riverscapes Viewer](https://viewer.riverscapes.net). This page explains how that automation works so you know what to expect when you add or change QML files.

## Why this exists

Symbology for the Riverscapes Viewer is authored as QGIS styles (`.qml` files) because QGIS is the tool our analysts actually use. But the web viewer needs symbology in a JavaScript-friendly JSON format. The GitHub Action runs [QML2WebSymbology.py](../../python/QML2WebSymbology.py) to bridge the two — you maintain QML, and the JSON is generated for you.

## Directory layout

| Directory | Contents | Who writes it |
|---|---|---|
| `Symbology/qgis/<Context>/` | Your `.qml` files, organized by program/context (e.g. `BRAT/`, `Anthro/`, `Hydro/`) | You (humans) |
| `Symbology/web/<Context>/` | Generated `.json` files, one per QML, mirroring the QGIS folder structure | The GitHub Action (bot) |

A file named `Symbology/qgis/BRAT/barrier_density.qml` produces `Symbology/web/BRAT/barrier_density.json`.

The generated JSON is also served publicly, so the viewer and external consumers read it from URLs like:

```
https://xml.riverscapes.xyz/Symbology/web/BRAT/barrier_density.json
```

## When it runs

The action (`.github/workflows/symbology_sync.yml`) runs in two situations:

1. **Automatically** — on every push to `master` that changes anything under `Symbology/qgis/**`.
2. **Manually** — from the **Actions** tab of the repo: select *Symbology Sync* → *Run workflow* → *Run workflow*. This is useful if you merged QML files some other way (e.g. via a merge commit that the path filter missed) or if a previous run failed partway.

Notes:

- Only one run per branch happens at a time; a newer push cancels an in-progress run and starts fresh.
- The bot's own commit is tagged `[skip ci]`, so the action does **not** re-trigger itself in an infinite loop.
- The bot pushes to `master` directly with the `SYMBOLOGY_SYNC_TOKEN` fine-grained PAT (Contents: Read & Write on this repo). The PAT's owner must be a member of an org team that sits on the `master` ruleset's bypass list (**Settings → Rules → Rulesets**, *Always allow*). The `GITHUB_TOKEN` identity (the GitHub Actions app) **cannot** be added to a bypass list, so a PAT is required. Humans still need pull requests — the exemption is scoped to the bot's team.
- **One-time setup:** create the PAT for a (bot) account, put that account in an org team, add that team to the `master` ruleset's bypass list, then save the PAT as the `SYMBOLOGY_SYNC_TOKEN` Actions secret (Settings → Secrets and variables → Actions).

## What happens during a run

The action runs on a fresh Ubuntu runner with Python 3.12 and performs these steps:

1. **Check out** the repository.
2. **Install dependencies** — the converter lives in `python/` and uses `uv` to sync its environment.
3. **Convert** — runs `QML2WebSymbology.py --missing`:

   - Scans every subdirectory of `Symbology/qgis/`.
   - For each `.qml` file, generates the matching `.json` in `Symbology/web/<same folder>/`.
   - The output references `Symbology/web/vector.schema.json` via its `$schema` property, and the converter will fail the run if a file cannot be parsed into that shape. (Strict schema validation is only available when running the converter locally with `--validate`.)

4. **Commit** — if any new JSON files were produced, they are committed to `master` by `github-actions[bot]` with the message *"Auto-convert QML → JSON for missing symbology files [skip ci]"*. If nothing new was produced, no commit is made.

## What the converter supports

`QML2WebSymbology.py` handles the common QGIS style features:

- **Renderer types**: graduated, single symbol, categorized, and rule-based renderers
- **Geometry types**: points/circles, lines, and fills (polygons)
- **QML dialects**: both `<Option>`-style (QGIS 2) and `<prop>`-style (QGIS 3) attributes
- **Colours**: solid and translucent (alpha) colours, converted to `rgb()`/`rgba()`/`hsla()` strings
- **Labels**: range labels (e.g. `"1 - 2"`, `"> 10"`) and category labels end up in the JSON `legend` so the viewer can render a legend automatically

The output JSON contains a `$schema` reference plus a `legend` (list of `[colour, label]` pairs) and `layerStyles` (renderer paint/line/circle settings).

## What is *not* created or updated

This is important: **the action only creates missing JSON files. It never overwrites or regenerates an existing JSON.**

Specifically:

- **Existing JSON files are left untouched.** If you edit a QML whose JSON already exists, the action will not update the JSON. The bot reports it as "skipped".
- **No raster symbology is produced.** `.qml` files that contain a raster renderer are skipped (raster symbology is handled outside this converter).
- **No JSON for non-vector layers.** Layers with no geometry (e.g. label-only layers) or with fully transparent symbols produce no output — they are skipped, not errors.
- **Nothing else is committed.** The bot's commit touches only `Symbology/web/`. It never modifies your QML files or anything else in the repo.
- **No other formats.** The action creates only the one JSON per QML — no thumbnails, no legend images, no QML copies.

## Adding new symbology (recommended workflow)

1. Put your `.qml` file in the folder that matches your program, e.g. `Symbology/qgis/MyProject/`.
   - The folder name becomes part of the output path and the URL, so choose it carefully.
   - Each `.qml` file gets its own JSON; a single QML containing several layers is also fine — the converter maps them into the JSON `layerStyles`.
2. Commit and push to `master`. The push must **include** changes under `Symbology/qgis/` for the action to run.
3. Within a couple of minutes the action finishes and adds the new JSON to `Symbology/web/` in a follow-up commit from the bot.
4. Reference the JSON in the viewer, e.g. `https://xml.riverscapes.xyz/Symbology/web/MyProject/my_style.json`.

## Updating existing symbology

Because the action never overwrites an existing JSON, updating a style takes one extra step:

1. Edit or replace the `.qml` file in `Symbology/qgis/`.
2. **Delete the corresponding `.json`** in `Symbology/web/`.
3. Commit **both** the QML change and the JSON deletion together and push to `master`. (Deleting only the JSON will *not* trigger the action — the trigger watches `Symbology/qgis/`, not `Symbology/web/`.)
4. The action detects the missing JSON and regenerates it from your updated QML.

Alternatively, regenerate locally and push the result yourself:

```
cd python
uv run python QML2WebSymbology.py --dir MyProject --force
```

(`--force` overwrites existing JSON; without it, existing files are skipped.)

## If something goes wrong

- **The workflow fails** when any QML cannot be converted (e.g. an unsupported renderer or malformed XML). Open the failing run in the **Actions** tab — the log names the offending file with a `Parse error` or `Write error` line.
- Converter messages you may see in the logs:
  - `skipped` — output already exists (expected; see above), raster renderer, or no convertible vector symbology
  - `note ... distinct rule colours; only the first is applied` — for rule-based renderers with multiple colours; the web schema has no per-rule filters, so only the first rule's colour is used
- **The final `git push` failed with `GH006: Protected branch update failed`?** The bot's bypass is missing or was removed: confirm the `SYMBOLOGY_SYNC_TOKEN` secret exists and that its owner's team is on the `master` ruleset's bypass list (**Settings → Rules → Rulesets**, *Always allow*). The GitHub Actions app is *not* an eligible bypass actor — don't expect to find it in the bypass list.
- **The action didn't run at all?** Check that your push touched `Symbology/qgis/**` and went to `master`, then use the manual *Run workflow* button.
