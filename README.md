# <center>NvimWord</center>

![logo](/assets/logo.webp)

## You writing tool that will multiply 10x your writing experience!

This #NeoVim setup will target writers of all kind with amazing tools put toghether to speed up your creative process without interfearing in your creativity

Launch it with `NVIM_APPNAME=neoword nvim` so it uses this config, not `~/.config/nvim`.

Main charachteristics:

- Nice intro screen for easy start and search in your project
- Auto closing symbols ( [] , {}, '', "", etc.)
- Version Control (git, gitHub)
- Nicer markdown render while typing
- comprehensive file explorer
- auto save sessions in case working in as many projects as you want
- blazing fast finding tools within your project, notes, etc (you can expand config as far as you need)
- TODO COMMENTS that you can leave anywhere you need to never forget to research anything, change or fix whatever you need
- Zen Mode and line highlighting
- Spell check in many languages (English + Spanish)
- Grammar hints while writing (Harper), wiki-style markdown links (Marksman)
- always easy acces to help so you never get lost until you master how to use this tool

---

## Notes from the Aug 2026 pass

This is a log of what was changed so you can read it later. The config is still a mixed prose + notes setup.

### Fixes

- **Explorer keys were calling Oil**, but Oil was never installed. `<Up>`, `<leader>kf`, and `<leader>ka` now open Snacks explorer (`<C-e>` is still the toggle).
- **`<C-[>` is Escape** in the terminal. Quickfix is `]q` / `[q` instead, so Esc still works.
- **Spell** is bilingual: `en` + `es` in `lua/config/spell.lua`. Markdown and text files turn spell on automatically.
- **Folding** is manual and off by default so markdown headings do not auto-fold.
- **Journal** files (`<leader>nj`) use the date as the title, not `# New Note`.
- **Duplicate** new-file logic and `<leader>sr` (grug-far) were cleaned up. Alpha “New File” uses the same `CreateNewFile` command.

### Treesitter (`master` vs `main`)

nvim-treesitter has two branches that are not compatible.

- `master` uses `require("nvim-treesitter.configs").setup({ ... })` — that is what this config already had.
- `main` is a rewrite. That setup call does not exist there.

The lockfile had drifted onto `main` while the Lua was still written for `master`. Highlighting can silently break that way. It is pinned back to `master` in `lua/plugins/treesitter.lua`. Leftover JS/TS parsers were dropped; markdown/lua/html/json stay.

If `:Lazy update` ever breaks treesitter, check that the plugin is still on `master`, or migrate the config to `main` on purpose.

### Writing feel (iA Writer–leaning)

- Colors: **binary** paper/ink greys (`#f5f5f5` / `#1a1a1a`). Tokyo Night and Zenbones stay installed if you want `:colorscheme` back.
- Markdown and `.txt`: wrap at word boundaries, no line numbers/signcolumn, typewriter scroll on by default (`<leader>tt` toggles).
- Centered ~72-char column auto-enables for markdown/text (**NoNeckPain** / `<leader>cc`). **Zen** (`<leader>z`) is full focus + Twilight.
- Status line is quiet: filename, word/char count, time.
- `render-markdown` is muted (no heading icons/backgrounds).

### New plugins

| Plugin | What it is for |
| --- | --- |
| render-markdown.nvim | In-buffer markdown (headings, lists, checkboxes). Replaced disabled Markview. |
| marksman | Markdown LSP: `[[wiki links]]`, outline, diagnostics. |
| harper-ls | Grammar/style. Vim spell still handles spelling. Blink completion stays **off** in markdown/text. |
| mason.nvim | Installs lua_ls, marksman, harper-ls on first launch. |
| img-clip.nvim | Paste a screenshot into markdown. |
| mini.align | Align markdown tables (`ga`). Already using mini for pairs/surround. |
| gitsigns.nvim | Git hunks in the gutter. Zen Mode can hide them. |

First start after this change may take a moment while Mason downloads language servers.

### New / changed keys

| Key | Action |
| --- | --- |
| `<leader>e` | Show grammar/markdown diagnostic under cursor |
| `]d` / `[d` | Next / previous diagnostic |
| `<leader>pi` | Paste image from clipboard into an `assets/` folder |
| `<leader>tt` | Typewriter scroll on/off |
| `<leader>gs` | Manual git sync (only if you re-enable git_sync) |
| `ga` | Align (tables, etc.) |
| `]q` / `[q` | Quickfix next / prev |

Unchanged writing keys still work: `<leader>nf` new file, `<leader>nn` note in `~/notes`, `<leader>nj` journal, `<leader>z` zen, `<leader>cc` center buffer, `<leader>S` spell toggle, `z=` spell suggestions.

### Auto git sync (disabled)

There used to be automatic `git add` / commit / push / pull on enter and quit, for `~/notes` and `~/journal`.

That idea is still good for backing up notes, but a blocking `git pull` made Neovim wait **seconds** on every open and `:qa`. The code is kept, commented out, in `lua/config/git_sync.lua`. The load line in `init.lua` is commented too.

To turn it back on:

1. Uncomment the big `--[[ ... ]]` block in `lua/config/git_sync.lua`
2. Uncomment `require("config.git_sync")` in `init.lua`

The saved version pulls in the background on enter and detaches commit/push on quit, so it should not freeze the UI. `<leader>gs` is a manual full sync you wait for. LazyGit (`<leader>gg`) is separate and still enabled.

### Files worth knowing

- `lua/config/keymaps.lua` — most keybindings, new file / note / journal
- `lua/config/spell.lua` — spell languages
- `lua/config/git_sync.lua` — disabled auto-sync (see above)
- `after/ftplugin/markdown.lua` and `text.lua` — wrap, spell, `gj`/`gk`
- `lua/plugins/` — one file per plugin
