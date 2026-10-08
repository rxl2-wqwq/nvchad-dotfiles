require("nvchad.configs.lspconfig").defaults()

-- stylua tidak dimasukkan: formatting lua sudah lewat conform (lihat configs/conform.lua)
local servers = { "html", "cssls", "jdtls", "clangd", "pyright", "ts_ls", "eslint", "intelephense", "harper_ls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
