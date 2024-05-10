local status, whichkey = pcall(require, "which-key")
if (not status) then
  return
end

local status2, rest = pcall(require, "rest-nvim")
if (not status2) then
  return
end

local keymap = {
  r = {
    r = { rest.run, "Run last request" },
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
