local status, whichKey = pcall(require, "which-key")

local keymap = {
  f = {
    name = "Flutter",
    e = { "<cmd>FlutterEmulators<cr>", "Emulators" },
    d = { "<cmd>FlutterDevices<cr>", "Devices" },
    c = { "<cmd>FlutterCopyProfilerUrl<cr>", "Run" },
    l = { "<cmd>FlutterLogClear<cr>", "Logs" },
    q = { "<cmd>FlutterQuit<cr>", "Quit" },
    o = { "<cmd>FlutterOutlineToggle<cr>", "Flutter outline" }
  }
}

whichKey.register(keymap, {
  prefix = '<leader>',
  mode = 'n',
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
})

keymap = {
  h = {
    r = { "<cmd>FlutterReload<cr>", "Hot Reload" },
    R = { "<cmd>FlutterRestart<cr>", "Hot Restart" },
  }
}

whichKey.register(keymap, {
  mode = 'n',
  prefix = '<leader>',
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
})
