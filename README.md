# NvChad Config

NvChad v2.5 config — Neovim setup with IDE-like features: file explorer,
autocomplete, LSP, formatter, debugger, git panel, and test runner.

> Based on [NvChad starter](https://github.com/NvChad/starter). Core modules come from `NvChad/NvChad` via `require "nvchad.*"`.

---

## 🚀 First-time setup (do this once)

### 1. Requirements

| Tool | Why | Install |
|------|-----|---------|
| **Neovim 0.11+** | Uses `vim.lsp.config` API | `sudo pacman -S neovim` |
| **git** | Plugin manager (lazy.nvim) | `sudo pacman -S git` |
| **make** + C compiler | Build telescope-fzf-native | `sudo pacman -S make gcc` |
| **lazygit** | Git panel (`<leader>gg`) | `sudo pacman -S lazygit` |
| **ripgrep** | Telescope live grep | `sudo pacman -S ripgrep` |
| **Python + debugpy** | Python debugger | `pip install debugpy` (or via Mason) |

> Nerd Font is required for icons: `sudo pacman -S ttf-nerd-fonts-symbols`

### 2. First launch

Open `nvim` and wait for lazy.nvim to install all plugins. Then:

```
:Mason
```

Inside Mason, install language servers you need (pyright, clangd, etc).
**Mason packages auto-install** for those listed in `chadrc.lua` and `lspconfig.lua`.

If a plugin fails to build (e.g. fzf-native), run:

```
:Lazy build telescope-fzf-native.nvim
```

### 3. Verify

```
:checkhealth
:Lazy          # all plugins should be "loaded", no red errors
:Mason         # LSP/tools installed
```

---

## 📖 How to use (common workflows)

### Editing a file
1. Open a folder: `nvim .` — file tree appears (`<C-n>` to toggle).
2. Open files with `<leader>ff` (find) or the tree.
3. Code completion pops up automatically (blink.cmp). `Tab` / arrows to pick, `Enter` to accept.
4. Save: `<C-s>`. If a formatter is configured, it runs on save.

### Python: run a script
- Open a `.py` file, press `<leader>rf` → runs `python3 <file>` in the terminal.
- Toggle terminal anytime: `<C-p>`.

### Python: debug (breakpoints)
1. Put cursor on a line, press `<leader>db` (adds a red breakpoint dot).
2. Press `<F5>` to start. Debug UI opens (variables, stack, breakpoints).
3. Step through: `<F10>` (over), `<F11>` (into), `<F12>` (out).
4. Inspect: hover variable, or `<leader>de` to eval an expression.
5. Stop: `<leader>dt`.

### Python: run tests
- `<leader>tt` = run test under cursor.
- `<leader>tf` = run all tests in file. `<leader>ta` = whole project.
- `<leader>ts` = toggle test summary panel.

### Git
- Quick line-level: `<leader>gs` (stage hunk), `<leader>gb` (blame), `<leader>gd` (diff).
- Full panel: `<leader>gg` opens Lazygit (stage, commit, branch, push, all visual).

### Search
- `<leader>ff` find files, `<leader>fw` grep text in project, `<leader>fb` switch buffer.

### Seeing all errors
- `<leader>xx` opens the Problems panel with every error/warning. Jump to one and fix it.

### Jump around code
- `gd` definition, `gr` references, `K` hover docs, `<leader>o` outline panel.

---

## ⌨️ Keybindings

`<Leader>` = **Space**.

### General

| Keys | Function |
|------|----------|
| `;` | Enter command mode (`:`) |
| `jk` (insert) | Exit insert mode |
| `<C-s>` | Save file |
| `<leader>qq` | Save & quit all windows |
| `<leader>z` | Toggle zen mode (focus) |
| `<Esc>` | Clear search highlights |
| `<C-c>` | Copy whole file to clipboard |
| `<leader>n` | Toggle absolute line numbers |
| `<leader>rn` | Toggle relative line numbers |
| `<leader>/` | Toggle comment (normal / visual) |
| `<leader>fm` | Format file (conform) |
| `<leader>ch` | Open cheatsheet |
| `<leader>wK` | Show all keymaps (which-key) |

### Buffers & Tabs (tabufline)

| Keys | Function |
|------|----------|
| `<leader>b` | New empty buffer |
| `<tab>` / `<S-tab>` | Next / previous buffer |
| `<leader>x` | Close current buffer |

### Move Lines

| Keys | Function |
|------|----------|
| `<A-j>` / `<A-k>` (n) | Move line down / up |
| `<A-j>` / `<A-k>` (i) | Move line down / up, stays in insert |
| `<A-j>` / `<A-k>` (v) | Move selected block down / up |

### Windows & Splits

| Keys | Function |
|------|----------|
| `<C-h/j/k/l>` | Move between windows |
| `<leader>-` | Split horizontal (below) |
| `<leader>\|` | Split vertical (right) |
| `<leader>wd` | Close active window |

### File Tree (nvim-tree)

| Keys | Function |
|------|----------|
| `<C-n>` | Toggle file tree |
| `<leader>e` | Focus file tree |

### Terminal

| Keys | Function |
|------|----------|
| `<C-p>` | Toggle floating terminal |
| `<leader>rt` | New terminal (floating) |
| `<leader>h` | New horizontal terminal |
| `<leader>v` | New vertical terminal |
| `<A-h>` / `<A-v>` / `<A-i>` | Toggle horizontal / vertical / floating term |
| `<leader>rf` | Run current Python file |
| `<leader>rb` | Run current bash/sh file |
| `<C-x>` (terminal) | Escape terminal mode |

### LSP (active when a language server attaches)

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
| `<leader>cd` | Show diagnostic for current line |
| `<leader>ds` | Send diagnostics to location list |
| `<leader>wa` / `<leader>wr` | Add / remove workspace folder |

### Debugger (nvim-dap + debugpy)

| Keys | Function |
|------|----------|
| `<F5>` | Start / continue debug |
| `<F10>` | Step over |
| `<F11>` | Step into |
| `<F12>` | Step out |
| `<leader>db` | Toggle breakpoint |
| `<leader>dB` | Conditional breakpoint |
| `<leader>dc` | Continue |
| `<leader>di` / `<leader>do` / `<leader>dO` | Step into / out / over |
| `<leader>du` | Toggle debug UI (variables, stack, breakpoints) |
| `<leader>dr` | Toggle REPL |
| `<leader>de` | Eval expression (normal / visual) |
| `<leader>dt` | Terminate debug session |
| `<leader>dl` | Run last debug session |
| `<leader>dm` | Debug nearest Python test method |

### Problems / Diagnostics (Trouble)

| Keys | Function |
|------|----------|
| `<leader>xx` | Toggle all diagnostics panel |
| `<leader>xd` | Toggle buffer diagnostics |
| `<leader>xq` | Toggle quickfix list |
| `<leader>xs` | Toggle symbols (outline) panel |
| `<leader>xl` | Toggle LSP references/definitions panel |

### Git — line level (Gitsigns)

| Keys | Function |
|------|----------|
| `<leader>gp` | Preview hunk diff (popup) |
| `<leader>gb` | Git blame current line |
| `<leader>gd` | Diff whole buffer |
| `<leader>gs` | Stage hunk |
| `<leader>gu` | Undo stage hunk |
| `<leader>gr` | Reset/revert hunk |

> **Note:** `<leader>gd` = Gitsigns diff, plain `gd` = LSP go-to-definition.

### Git — full panel (Lazygit)

| Keys | Function |
|------|----------|
| `<leader>gg` | Open Lazygit (stage, commit, branch, push) |
| `<leader>gf` | Lazygit for current file |

### Outline (Aerial)

| Keys | Function |
|------|----------|
| `<leader>o` | Toggle code outline panel |

### Tests (Neotest)

| Keys | Function |
|------|----------|
| `<leader>tt` | Run nearest test |
| `<leader>tf` | Run all tests in current file |
| `<leader>ta` | Run all tests in project |
| `<leader>ts` | Toggle test summary panel |
| `<leader>td` | Debug nearest test |

### Search (Telescope — fzf sorter)

| Keys | Function |
|------|----------|
| `<leader>ff` | Find files |
| `<leader>fa` | Find all files (incl. hidden/ignored) |
| `<leader>fw` | Live grep (search text in project) |
| `<leader>fz` | Fuzzy find in current buffer |
| `<leader>fb` | List open buffers |
| `<leader>fo` | Recent files (oldfiles) |
| `<leader>fh` | Search help |
| `<leader>ma` | Find marks |
| `<leader>fq` | Open quickfix list |
| `<leader>cm` | View git commits |
| `<leader>gt` | Git status |
| `<leader>pt` | Pick hidden terminal |
| `<leader>th` | NvChad themes picker |

### Markdown (Markview)

| Keys | Function |
|------|----------|
| `<leader>mv` | Toggle Markview rendering |
| `<leader>ms` | Split view rendering |

### Flash (jump navigation)

| Keys | Function |
|------|----------|
| `s` | Flash jump |
| `S` | Flash Treesitter |
| `r` (operator) | Remote Flash |
| `R` (operator/visual) | Flash Treesitter search |

---

## 🧩 Installed Plugins & Tools

- **Editing:** LSP (pyright, clangd, jdtls, ts_ls, eslint, intelephense, html, cssls), Treesitter (incl. python, yaml, dockerfile), conform (formatters: black, prettier, stylua, shfmt, clang-format)
- **Completion:** blink.cmp + LuaSnip + friendly-snippets
- **Search:** Telescope + fzf-native
- **Debug:** nvim-dap + nvim-dap-ui + nvim-dap-python (debugpy)
- **Diagnostics:** Trouble, tiny-inline-diagnostic
- **Git:** Gitsigns + Lazygit
- **Navigation:** Aerial (outline), nvim-navic (breadcrumbs)
- **Tests:** Neotest + neotest-python
- **UI/UX:** which-key, noice, hlchunk, markview, flash, zen-mode
- **Terminal:** floaterm, nvchad.term
- **Extra:** vim-blade, vim-visual-multi

---

## 🔧 Customizing

- Change theme: edit `lua/chadrc.lua` → `M.base46.theme`, or press `<leader>th` to preview.
- Add keybind: edit `lua/mappings.lua`.
- Add plugin: edit `lua/plugins/init.lua`, then `:Lazy sync`.
- LSP servers: edit `lua/configs/lspconfig.lua`.
- Formatters: edit `lua/configs/conform.lua`.

---

# Credits

1) Lazyvim starter https://github.com/LazyVim/starter as the base of NvChad starter.
2) NvChad https://github.com/NvChad/NvChad
