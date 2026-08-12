local options = {
  formatters_by_ft = {
    python = { "black" },
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    cpp = { "clang-format" },
  },

  format_on_save = {
    --   -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
