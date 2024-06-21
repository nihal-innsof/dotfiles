local status, whichKey = pcall(require, "which-key")
if not status then
  return
end

local keymap = {
  g = {
    G = {
      function()
        require('neogit').open()
      end, "Open Neogit"
    }
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
