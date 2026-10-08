require "nvchad.mappings"

-- ===== CUSTOM KEYBINDS =====
-- Cek di README.md untuk dokumentasi lengkap tiap mapping.

local map = vim.keymap.set

-- ===== GENERAL =====
map("n", ";", ":", { desc = "CMD enter command mode" }) -- ; = : (masuk mode command)
map("i", "jk", "<ESC>") -- jk = keluar insert mode

-- Save file (semua mode)
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr><esc>", { desc = "Save file" })

-- Quit all
map("n", "<leader>qq", ":wqall<CR>", { desc = "Quit all windows" })

-- ===== LSP (buffer-local, aktif saat server attach) =====
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("LspMappings", { clear = true }),
  callback = function()
    local bmap = function(keys, fn, desc)
      vim.keymap.set("n", keys, fn, { buffer = true, desc = desc })
    end

    -- Navigation
    bmap("gd", vim.lsp.buf.definition, "Go to definition")
    bmap("gD", vim.lsp.buf.declaration, "Go to declaration")
    bmap("gr", vim.lsp.buf.references, "Go to references")
    bmap("<leader>D", vim.lsp.buf.type_definition, "Go to type definition")

    -- Docs / info
    bmap("K", vim.lsp.buf.hover, "LSP hover docs")

    -- Actions
    bmap("<leader>ra", require("nvchad.lsp.renamer"), "Rename symbol")
    bmap("ga", vim.lsp.buf.code_action, "Code action")
    bmap("<leader>cf", vim.lsp.buf.format, "Format buffer")

    -- Diagnostics
    bmap("[d", vim.diagnostic.goto_prev, "Previous diagnostic")
    bmap("]d", vim.diagnostic.goto_next, "Next diagnostic")
    bmap("<leader>cd", vim.diagnostic.open_float, "Show line diagnostics")

    -- Workspace (jika perlu, aktif di lspconfig sudah nonaktif default)
    bmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "Add workspace folder")
    bmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder")
  end,
})

-- ===== MOVE LINES (n / i / v) =====
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move line down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move line up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move line down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move line up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move selection up" })

-- ===== WINDOWS / SPLITS =====
map("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })

-- ===== TERMINAL (Floaterm) =====
map("n", "<C-p>", ":FloatermToggle<CR>", { silent = true, desc = "Toggle terminal" })
map("n", "<leader>rt", "<cmd>FloatermNew<CR>", { desc = "New terminal" })
-- Jalankan file Python aktif di terminal
map("n", "<leader>rf", function()
  vim.cmd("FloatermSend python3 " .. vim.fn.expand("%:p"))
end, { desc = "Run python file in terminal" })
-- Jalankan file bash/sh aktif di terminal
map("n", "<leader>rb", function()
  vim.cmd("FloatermSend bash " .. vim.fn.expand("%:p"))
end, { desc = "Run bash file in terminal" })

-- ===== GIT (Gitsigns) =====
map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Preview hunk diff" })
map("n", "<leader>gb", "<cmd>Gitsigns blame_line<CR>", { desc = "Git blame line" })
map("n", "<leader>gd", "<cmd>Gitsigns diffthis<CR>", { desc = "Git diff this buffer" })
map("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
map("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>", { desc = "Unstage hunk" })
map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })

-- ===== TELESCOPE (search) =====
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { desc = "Live grep text" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Fuzzy find in buffer" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "List buffers" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
map("n", "<leader>fq", "<cmd>Telescope quickfix<cr>", { desc = "Quickfix list" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<cr>", { desc = "Git commits" })

-- ===== MARKVIEW =====
map("n", "<leader>mv", "<cmd>Markview Toggle<CR>", { desc = "Toggle Markview" })
map("n", "<leader>ms", "<cmd>Markview splitToggle<CR>", { desc = "Markview split view" })
