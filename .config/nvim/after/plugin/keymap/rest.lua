local status, whichkey = pcall(require, "which-key")
if (not status) then
  return
end

local keymap = {
  r = {
    r = { "<cmd>Rest run<CR>", "Run request" },
    s = { "<cmd>Telescope rest select_env<CR>", "Select env file" },
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
