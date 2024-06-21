local status, whichkey = pcall(require, "which-key")
if (not status) then
  return
end

local keymap = {
  g = {
    G = {
      function()
        require("neogit").open()
      end,
      "Neogit" },
  }
}

whichkey.register(keymap, {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
})
