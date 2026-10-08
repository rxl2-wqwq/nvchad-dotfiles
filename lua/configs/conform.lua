local options = {
  formatters_by_ft = {
    python = { "black" },
    lua = { "stylua" },
    css = { "prettier" },
    scss = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    yaml = { "prettier" },
    php = function(bufnr)
      -- php-cs-fixer butuh composer.json untuk menentukan versi PHP project
      return vim.fs.root(bufnr, { "composer.json" }) and { "php_cs_fixer" } or {}
    end,
    sh = { "shfmt" },
    cpp = { "clang-format" },
  },

  format_on_save = {
    --   -- These options will be passed to conform.format()
    timeout_ms = 2000,
    lsp_fallback = true,
  },
}

return options
