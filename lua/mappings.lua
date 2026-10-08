require "nvchad.mappings"

-- ============================================================================
-- CUSTOM KEYBINDS
--
-- <Leader> = Space
-- Docs lengkap + cara pakai: lihat README.md
--
-- Leader groups:
--   <leader>f*  Search (Telescope)        <leader>d*  Debugger (dap)
--   <leader>g*  Git                        <leader>x*  Problems (Trouble)
--   <leader>t*  Tests (Neotest)            <leader>r*  Run / rename
--   <leader>c*  Code / format              <leader>w*  Window / workspace
--   <leader>m*  Markdown (Markview)        <leader>q*  Quit
--
-- Ketik <leader>ch untuk cheatsheet, atau <leader>wK untuk semua keymap.
-- ============================================================================

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
  callback = function(args)
    local bufnr = args.buf
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

    -- Breadcrumb (navic)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.documentSymbolProvider then
      require("nvim-navic").attach(client, bufnr)
      -- ponytail: winbar window-local, cukup untuk window yang aktif saat attach
      vim.wo.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
    end
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

-- ===== DEBUGGER (nvim-dap) =====
map("n", "<F5>", function()
  require("dap").continue()
end, { desc = "Debug: start / continue" })
map("n", "<F10>", function()
  require("dap").step_over()
end, { desc = "Debug: step over" })
map("n", "<F11>", function()
  require("dap").step_into()
end, { desc = "Debug: step into" })
map("n", "<F12>", function()
  require("dap").step_out()
end, { desc = "Debug: step out" })
map("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "Debug: toggle breakpoint" })
map("n", "<leader>dB", function()
  require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
end, { desc = "Debug: conditional breakpoint" })
map("n", "<leader>dc", function()
  require("dap").continue()
end, { desc = "Debug: continue" })
map("n", "<leader>di", function()
  require("dap").step_into()
end, { desc = "Debug: step into" })
map("n", "<leader>do", function()
  require("dap").step_out()
end, { desc = "Debug: step out" })
map("n", "<leader>dO", function()
  require("dap").step_over()
end, { desc = "Debug: step over" })
map("n", "<leader>du", function()
  require("dapui").toggle()
end, { desc = "Debug: toggle UI" })
map("n", "<leader>dr", function()
  require("dap").repl.toggle()
end, { desc = "Debug: toggle REPL" })
map({ "n", "v" }, "<leader>de", function()
  require("dap").eval()
end, { desc = "Debug: eval expression" })
map("n", "<leader>dt", function()
  require("dap").terminate()
end, { desc = "Debug: terminate" })
map("n", "<leader>dl", function()
  require("dap").run_last()
end, { desc = "Debug: run last" })
map("n", "<leader>dm", function()
  require("dap-python").test_method()
end, { desc = "Debug: test method (python)" })

-- ===== PROBLEMS / DIAGNOSTICS (Trouble) =====
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Problems: all diagnostics" })
map("n", "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Problems: buffer diagnostics" })
map("n", "<leader>xq", "<cmd>Trouble qflist toggle<CR>", { desc = "Problems: quickfix list" })
map("n", "<leader>xs", "<cmd>Trouble symbols toggle<CR>", { desc = "Problems: symbols (outline)" })
map("n", "<leader>xl", "<cmd>Trouble lsp toggle<CR>", { desc = "Problems: LSP refs/defs" })

-- ===== GIT PANEL (Lazygit) =====
map("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Git: open Lazygit" })
map("n", "<leader>gf", "<cmd>LazyGitCurrentFile<CR>", { desc = "Git: Lazygit (current file)" })

-- ===== OUTLINE (Aerial) =====
map("n", "<leader>o", "<cmd>AerialToggle<CR>", { desc = "Toggle code outline" })

-- ===== TESTS (Neotest) =====
map("n", "<leader>tt", function()
  require("neotest").run.run()
end, { desc = "Test: run nearest" })
map("n", "<leader>tf", function()
  require("neotest").run.run(vim.fn.expand "%")
end, { desc = "Test: run current file" })
map("n", "<leader>ta", function()
  require("neotest").run.run(vim.loop.cwd())
end, { desc = "Test: run all" })
map("n", "<leader>ts", function()
  require("neotest").summary.toggle()
end, { desc = "Test: toggle summary" })
map("n", "<leader>td", function()
  require("neotest").run.run { strategy = "dap" }
end, { desc = "Test: debug nearest" })

-- ===== ZEN MODE =====
map("n", "<leader>z", "<cmd>ZenMode<CR>", { desc = "Toggle zen mode" })
