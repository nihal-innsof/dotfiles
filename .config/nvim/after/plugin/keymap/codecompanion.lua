-- Load which-key library safely, return if not foundocal status, whichkey = pcall(require, "which-key")
local status, whichkey = pcall(require, "which-key")
if (not status) then
  return
end

-- Return if CodeCompanion plugin is not loaded
if not package.loaded["codecompanion"] then
  return
end

-- Define normal mode keymaps for CodeCompanion plugin
local normal_keymaps = {
  c = {
    c = { "<cmd>CodeCompanionChat Toggle<CR>", "Open AI Chat" },
    t = { "<cmd>CodeCompanionActions<CR>", "AI Actions" },
    x = { "<cmd>CodeCompanionCmd<CR>", "Generate command line commands" },
  }
}

-- Register normal mode keymaps with which-key
whichkey.register(normal_keymaps, {
  mode = "n",               -- Normal mode
  prefix = "<leader>",      -- All commands begin with leader key
  buffer = nil,             -- Apply to all buffers
  silent = true,            -- Don't echo commands
  noremap = true,           -- Non-recursive mapping
  nowait = false,           -- Wait for additional keypresses
})

-- Define visual mode keymaps for CodeCompanion plugin
local visual_keymaps = {
  c = {
    c = { "<cmd>'<,'>CodeCompanion<CR>", "Inline Refactor" },
  }
}

-- Register visual mode keymaps with which-key
whichkey.register(visual_keymaps, {
  mode = "v",               -- Visual mode
  prefix = "<leader>",      -- All commands begin with leader key
  buffer = nil,             -- Apply to all buffers
  silent = true,            -- Don't echo commands
  noremap = true,           -- Non-recursive mapping
  nowait = false,           -- Wait for additional keypresses
})
if (not status) then
  return
end
