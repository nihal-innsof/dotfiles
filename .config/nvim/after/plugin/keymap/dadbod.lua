local status, whichkey = pcall(require, "which-key")
if (not status) then
  return
end

local keymap = {
  d = {
    b = {  "<cmd>DBUI<CR>", "Database UI" },
  }
}

whichkey.register(keymap, {
  prefix = "<leader>",
  silent = true,
  noremap = true,
})
