local status, whichkey = pcall(require, "which-key")
if (not status) then
  return
end

local keymap = {
  g = {
    t = {
      function()
        require("neogit").open()
      end,
      "Neogit" },
  }
}

whichkey.register(keymap, {
  prefix = "<leader>",
  silent = true,
  noremap = true,
})
