local status, wk = pcall(require, "which-key")
if not status then
  return
end

-- Using the new which-key API format for v3
wk.add({
  -- Define group name
  { "<leader>r",  group = "REST" },

  -- REST command
  { "<leader>rr", "<cmd>Rest run<cr>", desc = "Run request" },
}, {
  mode = 'n',
  silent = true,
  noremap = true,
  nowait = true,
})

