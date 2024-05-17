local status, whichkey = pcall(require, "which-key")
if (not status) then
  return
end

local keymap = {
  c = {
    p = { "<cmd>PickColor<cr>", "Toggle Zen Mode" },
  }
}

whichkey.register(keymap, {
  silent = true,
  noremap = true,
})
