local status, whichKey = pcall(require, "which-key")
if not status then
  return
end

local keymap = {
  r = {
    r = { "<cmd>Rest run<cr>", "Run request" }
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
