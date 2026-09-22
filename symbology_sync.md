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
- The bot's changes only touch `Symbology/web/`, which is outside the action's trigger path, so the action does **not** re-trigger itself in an infinite loop.

## What happens during a run

The action runs on a fresh Ubuntu runner with Python 3.12 and performs these steps:

1. **Check out** the repository.
2. **Install dependencies** — the converter lives in `python/` and uses `uv` to sync its environment.
3. **Convert** — runs `QML2WebSymbology.py --missing`:

   - Scans every subdirectory of `Symbology/qgis/`.
   - For each `.qml` file, generates the matching `.json` in `Symbology/web/<same folder>/`.
   - The output references `Symbology/web/vector.schema.json` via its `$schema` property, and the converter will fail the run if a file cannot be parsed into that shape. (Strict schema validation is only available when running the converter locally with `--validate`.)

4. **Commit & pull request** — if any new JSON files were produced, they are committed to a dedicated bot branch (`bot/symbology-sync-<run-id>`) by `github-actions[bot]` and a pull request is opened against `master`. The workflow then tries to auto-merge that PR as soon as the required status check (`validate (3.12)`) passes. If branch protection also requires an approving review, the PR stays open and the run logs its URL for a human to merge. If nothing new was produced, no branch, commit, or PR is created.

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
2. Commit and open a pull request against `master` (the branch is protected — changes must go through a PR). The PR must **include** changes under `Symbology/qgis/` for the action to run.
3. Merge the QML PR. Within a couple of minutes the action runs, opens a follow-up PR adding the new JSON to `Symbology/web/`, and merges it automatically once the required checks pass (or leaves it open for you to merge if a review is required).
4. Reference the JSON in the viewer, e.g. `https://xml.riverscapes.xyz/Symbology/web/MyProject/my_style.json`.

## Updating existing symbology

Because the action never overwrites an existing JSON, updating a style takes one extra step:

1. Edit or replace the `.qml` file in `Symbology/qgis/`.
2. **Delete the corresponding `.json`** in `Symbology/web/`.
3. Open a pull request against `master` that contains **both** the QML change and the JSON deletion. (Deleting only the JSON will *not* trigger the action — the trigger watches `Symbology/qgis/`, not `Symbology/web/`.)
4. After the PR is merged, the action detects the missing JSON, regenerates it from your updated QML, and delivers it via its own auto-merged pull request.

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
- **The bot's pull request wasn't merged automatically?** Open the run's log — it prints the PR link. The PR waits on the required `validate (3.12)` status check; if branch protection also requires an approving review (or auto-merge is disabled), a human has to merge it.
- **PR creation failed?** The run's last steps will show the error. `master` is protected, so the bot can only deliver through a PR; make sure the repo setting *Allow GitHub Actions to create and approve pull requests* is enabled.
- **The action didn't run at all?** Check that your merged PR touched `Symbology/qgis/**` and went to `master`, then use the manual *Run workflow* button (a manual run also opens the same kind of bot PR).
