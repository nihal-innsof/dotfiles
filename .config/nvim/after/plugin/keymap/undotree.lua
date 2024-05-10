local status, whichkey = pcall(require, "which-key")
if (not status) then
  return
end

local keymap = {
  u = { vim.cmd.UndotreeToggle, "Toggle Undotree" },
}

whichkey.register(keymap, {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
})
