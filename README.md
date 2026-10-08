# NvChad Config

NvChad v2.5 config for Python & cybersecurity work.

> Base repo: [NvChad starter](https://github.com/NvChad/starter) — core modules from `NvChad/NvChad` via `require "nvchad.*"`.

Structure:
- `lua/chadrc.lua` — theme, UI, dashboard, terminal, mason
- `lua/mappings.lua` — custom keybinds (documented below)
- `lua/options.lua` — editor options
- `lua/plugins/init.lua` — extra plugins
- `lua/configs/` — per-plugin config (lsp, conform, diagnostics, chunk)

---

# Keybindings

`<Leader>` = **Space**. All mappings below are **custom** ones you wrote.
Default NvChad keybinds are still active (e.g. `<leader>e` file tree, `<C-n>` toggle tree, `<leader>/` comment).

> **Conflict note:** `<leader>gd` is **Gitsigns diff** — not LSP go-to-definition
> (LSP uses plain `gd`, no leader). Don't get confused if both exist.

## General

| Keys | Function |
|------|----------|
| `;` | Enter command mode (`:`) |
| `jk` (insert) | Exit insert mode |
| `<C-s>` (n/i/v) | Save file |
| `<leader>qq` | Save & quit all windows |

## Move Lines

| Keys | Function |
|------|----------|
| `<A-j>` / `<A-k>` (n) | Move line down / up |
| `<A-j>` / `<A-k>` (i) | Move line down / up, stays in insert |
| `<A-j>` / `<A-k>` (v) | Move selected block down / up |

## Window / Split

| Keys | Function |
|------|----------|
| `<leader>-` | Split horizontal (below) |
| `<leader>\|` | Split vertical (right) |
| `<leader>wd` | Close active window |

*(Navigate windows with NvChad default `<C-h/j/k/l>`)*

## Terminal (Floaterm)

| Keys | Function |
|------|----------|
| `<C-p>` | Toggle terminal |
| `<leader>rt` | Open new terminal |
| `<leader>rf` | Run current Python file in terminal |
| `<leader>rb` | Run current bash/sh file in terminal |

## Git (Gitsigns)

| Keys | Function |
|------|----------|
| `<leader>gp` | Preview hunk diff (popup) |
| `<leader>gb` | Git blame current line |
| `<leader>gd` | Diff whole buffer |
| `<leader>gs` | Stage hunk |
| `<leader>gu` | Undo stage hunk |
| `<leader>gr` | Reset/revert hunk |

## LSP (active when language server attaches — `LspAttach`)

| Keys | Function |
|------|----------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Go to references (all usages) |
| `<leader>D` | Go to type definition |
| `K` | Hover docs (signature/type info) |
| `<leader>ra` | Rename symbol |
| `ga` | Code action (auto-fix, quick-fix) |
| `<leader>cf` | Format buffer (via LSP) |
| `[d` / `]d` | Previous / next diagnostic |
| `<leader>cd` | Show diagnostic for current line (float) |
| `<leader>wa` / `<leader>wr` | Add / remove workspace folder |

## Search (Telescope — uses fzf sorter)

| Keys | Function |
|------|----------|
| `<leader>ff` | Find files |
| `<leader>fw` | Live grep (search text in all files) |
| `<leader>fz` | Fuzzy find in current buffer |
| `<leader>fb` | List open buffers |
| `<leader>fo` | Recent files (oldfiles) |
| `<leader>fh` | Search help |
| `<leader>fq` | Open quickfix list |
| `<leader>cm` | View git commits |

## Markdown (Markview)

| Keys | Function |
|------|----------|
| `<leader>mv` | Toggle Markview rendering |
| `<leader>ms` | Split view rendering |

---

# Installed Plugins & Tools

- **Programming:** LSP (pyright, clangd, jdtls, ts_ls, eslint, intelephense, html, cssls, harper_ls), Treesitter (incl. python, yaml, dockerfile), conform (formatters: black, prettier, stylua, shfmt, clang-format)
- **Search:** Telescope + fzf-native (fast)
- **UI/UX:** blink.cmp, which-key, noice, hlchunk, markview, tiny-inline-diagnostic
- **Git:** gitsigns
- **Terminal:** floaterm
- **Extra/optional:** vim-blade, vim-visual-multi, flash

---

# Credits

1) Lazyvim starter https://github.com/LazyVim/starter as the base of NvChad starter.
2) NvChad https://github.com/NvChad/NvChad
