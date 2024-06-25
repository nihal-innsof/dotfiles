local status, whichKey = pcall(require, "which-key")
if not status then
  return
end

local keymap = {
  d = {
    b = { "<cmd>DBUI<cr>", "Database UI" },
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
