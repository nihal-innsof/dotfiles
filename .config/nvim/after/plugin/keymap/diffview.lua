local status, whichkey = pcall(require, "which-key")
if (not status) then
  return
end

local keymap = {
  d = {
    v = { "<cmd>DiffviewOpen<cr>", "Open Diffview" },
    q = { "<cmd>DiffviewClose<cr>", "Close Diffview" },
  },
  t = {
    h = { "<cmd>DiffviewFileHistory<cr>", "Toggle all File History" },
  },
  f = {
    h = { "<cmd>DiffviewFileHistory %<cr>", "Current File History" },
  }
}

whichkey.register(keymap, {
  mode = "n",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
})
