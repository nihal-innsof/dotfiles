local status, whichkey = pcall(require, "which-key")
if (not status) then
  return
end

local keymap = {
  c = {
    c = { "<cmd>CopilotChatToggle<CR>", "Open Copilot Chat" },
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
