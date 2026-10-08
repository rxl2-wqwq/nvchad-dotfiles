-- matikan virtual_text bawaan nvim (dan override dari nvchad.lsp.diagnostic_config)
-- supaya tidak dobel dengan inline diagnostic
vim.diagnostic.config { virtual_text = false }

-- jaga-jaga kalau ada yang menyalakan virtual_text lagi saat LSP attach
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    vim.diagnostic.config { virtual_text = false }
  end,
})

require("tiny-inline-diagnostic").setup {
  signs = {
    left = "",
    right = "",
    diag = "●",
    arrow = "    ",
    up_arrow = "    ",
    vertical = " │",
    vertical_end = " └",
  },
  blend = {
    factor = 0.22,
  },
}
