-- Debugger (mirip Run/Debug VSCode)
local dap = require "dap"
local dapui = require "dapui"

dapui.setup {}

-- Buka/tutup UI otomatis saat debug mulai/berhenti
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Adapter Python pakai debugpy (di-install via mason: pip debugpy)
require("dap-python").setup "python3"
