local status, whichkey = pcall(require, "which-key")
if (not status) then
  return
end

if not package.loaded["codecompanion"] then
  return
end

local keymap = {
  c = {
    c = { "<cmd>CodeCompanionChat<CR>", "Open AI Chat" },
    t = { "<cmd>CodeCompanionActions<CR>", "AI Actions" },
    x = { "<cmd>CodeCompanionCmd<CR>", "Generate command line commands" },
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
