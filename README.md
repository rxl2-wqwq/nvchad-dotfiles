# NvChad Config

Config NvChad v2.5 untuk programming Python & cybersecurity work.

> Base repo: [NvChad starter](https://github.com/NvChad/starter) — modul inti diambil dari `NvChad/NvChad` via `require "nvchad.*"`.

Struktur:
- `lua/chadrc.lua` — tema, UI, dashboard, terminal, mason
- `lua/mappings.lua` — custom keybind (dokumentasi di bawah)
- `lua/options.lua` — opsi editor
- `lua/plugins/init.lua` — plugin tambahan
- `lua/configs/` — config per-plugin (lsp, conform, diagnostics, chunk)

---

# Keybindings

`<Leader>` = **Spasi** (Space). Semua mapping di bawah adalah **custom** buatan sendiri.
Keybind bawaan NvChad masih aktif (contoh: `<leader>e` file tree, `<C-n>` toggle tree, `<leader>/` komentar).

> **Catatan konflik:** `<leader>gd` dipakai untuk **Gitsigns diff** — bukan LSP go-to-definition
> (LSP pakai `gd` polos, tanpa leader). Jangan bingung kalau dua-duanya ada.

## Umum (General)

| Keys | Fungsi |
|------|--------|
| `;` | Masuk mode command (`:`) |
| `jk` (insert) | Keluar dari insert mode |
| `<C-s>` (n/i/v) | Simpan file |
| `<leader>qq` | Simpan & tutup semua window |

## Pindah Baris (Move lines)

| Keys | Fungsi |
|------|--------|
| `<A-j>` / `<A-k>` (n) | Pindah baris ke bawah / atas |
| `<A-j>` / `<A-k>` (i) | Pindah baris bawah / atas, tetap di insert |
| `<A-j>` / `<A-k>` (v) | Pindah blok seleksi bawah / atas |

## Window / Split

| Keys | Fungsi |
|------|--------|
| `<leader>-` | Split horizontal (di bawah) |
| `<leader>\|` | Split vertikal (di kanan) |
| `<leader>wd` | Tutup window aktif |

*(Navigasi antar window: bawaan NvChad `<C-h/j/k/l>`)*

## Terminal (Floaterm)

| Keys | Fungsi |
|------|--------|
| `<C-p>` | Toggle terminal (buka/tutup) |
| `<leader>rt` | Buka terminal baru |
| `<leader>rf` | Jalankan file Python aktif di terminal |
| `<leader>rb` | Jalankan file bash/sh aktif di terminal |

## Git (Gitsigns)

| Keys | Fungsi |
|------|--------|
| `<leader>gp` | Preview diff hunk (di popup) |
| `<leader>gb` | Git blame baris aktif |
| `<leader>gd` | Diff seluruh buffer |
| `<leader>gs` | Stage hunk |
| `<leader>gu` | Undo stage hunk |
| `<leader>gr` | Reset/revert hunk |

## LSP (aktif saat language server menempel — `LspAttach`)

| Keys | Fungsi |
|------|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Go to references (liat semua pemakaian) |
| `<leader>D` | Go to type definition |
| `K` | Hover docs (info signature/type) |
| `<leader>ra` | Rename symbol |
| `ga` | Code action (auto-fix, quick-fix) |
| `<leader>cf` | Format buffer (via LSP) |
| `[d` / `]d` | Diagnostic sebelumnya / berikutnya |
| `<leader>cd` | Tampilkan diagnostic baris aktif (float) |
| `<leader>wa` / `<leader>wr` | Add / remove workspace folder |

## Search (Telescope — pakai sorter fzf)

| Keys | Fungsi |
|------|--------|
| `<leader>ff` | Cari file |
| `<leader>fw` | Live grep (cari teks di semua file) |
| `<leader>fz` | Fuzzy find di buffer aktif |
| `<leader>fb` | Daftar buffer terbuka |
| `<leader>fo` | File recent (oldfiles) |
| `<leader>fh` | Cari help |
| `<leader>fq` | Buka quickfix list |
| `<leader>cm` | Lihat git commits |

## Markdown (Markview)

| Keys | Fungsi |
|------|--------|
| `<leader>mv` | Toggle rendering Markview |
| `<leader>ms` | Split view rendering |

---

# Plugin & Alat yang Dipasang

- **Programming:** LSP (pyright, clangd, jdtls, ts_ls, eslint, intelephense, html, cssls, harper_ls), Treesitter (incl. python, yaml, dockerfile), conform (formatter: black, prettier, stylua, shfmt, clang-format)
- **Search:** Telescope + fzf-native (cepat)
- **UI/UX:** blink.cmp, which-key, noice, hlchunk, markview, tiny-inline-diagnostic
- **Git:** gitsigns
- **Terminal:** floaterm
- **Eksperimen/opsional:** vim-blade, vim-visual-multi, flash

---

# Credits

1) Lazyvim starter https://github.com/LazyVim/starter sebagai dasar NvChad starter.
2) NvChad https://github.com/NvChad/NvChad
