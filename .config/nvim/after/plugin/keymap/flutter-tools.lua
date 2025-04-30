local status, wk = pcall(require, "which-key")
if not status then
  return
end

-- Using the new which-key API format for v3
wk.add({
  -- Define group names
  { "<leader>f",   group = "Flutter" },
  { "<leader>h",   group = "Hot" },

  -- Flutter commands
  { "<leader>fe",  "<cmd>FlutterEmulators<cr>",                                                                                                                   desc = "Emulators" },
  { "<leader>fD",  "<cmd>FlutterDebug<cr>",                                                                                                                       desc = "Debug" },
  { "<leader>fR",  "<cmd>FlutterRun<cr>",                                                                                                                         desc = "Run" },
  { "<leader>fd",  "<cmd>FlutterDevices<cr>",                                                                                                                     desc = "Devices" },
  { "<leader>fc",  "<cmd>FlutterCopyProfilerUrl<cr>",                                                                                                             desc = "Copy Profiler Url" },
  { "<leader>fl",  "<cmd>FlutterLogClear<cr>",                                                                                                                    desc = "Logs" },
  { "<leader>fq",  "<cmd>FlutterQuit<cr>",                                                                                                                        desc = "Quit" },
  { "<leader>fo",  "<cmd>FlutterOutlineToggle<cr>",                                                                                                               desc = "Flutter outline" },
  -- Hot reload/restart commands
  { "<leader>hr",  "<cmd>FlutterReload<cr>",                                                                                                                      desc = "Hot Reload" },
  { "<leader>hR",  "<cmd>FlutterRestart<cr>",                                                                                                                      desc = "Hot Reload" },
  -- Debug exception breakpoints
  { "<leader>fea", "<cmd>lua require('dap').set_exception_breakpoints({'all'}); vim.notify('Now stopping on ALL exceptions', vim.log.levels.INFO)<cr>",           desc = "Stop on all exceptions" },
  { "<leader>feu", "<cmd>lua require('dap').set_exception_breakpoints({'uncaught'}); vim.notify('Now stopping on UNCAUGHT exceptions', vim.log.levels.INFO)<cr>", desc = "Stop on uncaught exceptions" },
  { "<leader>fen", "<cmd>lua require('dap').set_exception_breakpoints({}); vim.notify('Exception breakpoints DISABLED', vim.log.levels.INFO)<cr>",                desc = "Don't stop on exceptions" },

}, {
  mode = 'n',
  silent = true,
  noremap = true,
  nowait = true,
})
