local status, whichkey = pcall(require, "which-key")
if (not status) then
  return
end

local status2, telescope = pcall(require, "telescope.builtin")
if (not status2) then
  return
end

local keymap = {
  f = {
    f = { function()
      telescope.find_files({ no_ignore = false, hidden = true })
    end, "Find files" },
    r = { function()
      telescope.live_grep({ no_ignore = false, hidden = true })
    end, "Live Grep" },
    h = { function()
      telescope.help_tags()
    end, "List help tags" },
  },
  a = {
    c = { function()
      telescope.commands()
    end, "List commands" },
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
