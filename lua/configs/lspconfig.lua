require("nvchad.configs.lspconfig").defaults()

-- stylua tidak dimasukkan: formatting lua sudah lewat conform (lihat configs/conform.lua)
-- harper_ls dihapus: grammar checker English nyusahin komentar bahasa Indonesia
local servers = { "html", "cssls", "jdtls", "clangd", "pyright", "ts_ls", "eslint", "intelephense" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
