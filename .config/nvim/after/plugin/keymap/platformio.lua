local status, whichKey = pcall(require, "which-key")
if not status then
  return
end

local keymap = {
  p = {
    r = { "<cmd>Piorun<cr>", "PlatformIO Run" },
    m = { "<cmd>Piomon<cr>", "PlatformIO Monitor" },
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
