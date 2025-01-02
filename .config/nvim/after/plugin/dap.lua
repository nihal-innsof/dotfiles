local dap = require('dap')
local dapui = require('dapui')

dap.defaults.fallback.external_terminal = {
  command = '/usr/bin/kitty',
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

dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    -- command = '/absolute/path/to/codelldb/extension/adapter/codelldb',
    command = vim.fn.stdpath('data') .. '/mason/bin/codelldb',
    args = { "--port", "${port}" },

    -- On windows you may have to uncomment this:
    -- detached = false,
  }
}

dap.adapters["local-lua"] = {
  type = "executable",
  command = "node",
  args = {
    "~/debuggers/local-lua-debugger-vscode/extension/debugAdapter.js"
  },
  enrich_config = function(config, on_config)
    if not config["extensionPath"] then
      local c = vim.deepcopy(config)
      ---@diagnostic disable-next-line: inject-field
      c.extensionPath = "~/debuggers/local-lua-debugger-vscode/extension/debugAdapter.js"
      on_config(c)
    else
      on_config(config)
    end
  end
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

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

dap.configurations.c = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
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
