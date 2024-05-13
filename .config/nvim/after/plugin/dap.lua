local dap = require('dap')
local dapui = require('dapui')

dap.defaults.fallback.external_terminal = {
  command = '/usr/bin/alacritty',
  args = { '-e' },
}


dap.defaults.fallback.force_external_terminal = true

dap.adapters.dart = {
  type = 'executable',
  command = vim.fn.stdpath('data') .. '/mason/bin/dart-debug-adapter',
  -- command = 'flutter',
  args = { 'flutter' },
  -- args = { "debug_adapter" },
  options = {
    detached = true,
  },
}

dap.configurations.dart = {
  {
    type = "dart",
    request = "launch",
    name = "Launch flutter",
    dartSdkPath = "/home/nihal/flutter/bin/cache/dart-sdk/",
    flutterSdkPath = "/home/nihal/flutter/",
    program = "${workspaceFolder}/lib/main.dart",
    cwd = "${workspaceFolder}",
    console = 'terminal',
  }
}

local dap_breakpoint = {
  error = {
    text = "🔴",
    texthl = "LspDiagnosticsSignError",
    linehl = "",
    numhl = "",
  },
  rejected = {
    text = "🔘",
    texthl = "LspDiagnosticsSignHint",
    linehl = "",
    numhl = "",
  },
  stopped = {
    text = "🟢",
    texthl = "LspDiagnosticsSignInformation",
    linehl = "DiagnosticUnderlineInfo",
    numhl = "LspDiagnosticsSignInformation",
  },
}

vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)

dapui.setup()

require("telescope").load_extension("dap")
