local status, neotest = pcall(require, "neotest")
local status2, whichkey = pcall(require, "which-key")

if (not status) or (not status2) then
  return
end

local keymap = {
  t = {
    name = "Tests",
    w = { function() neotest.summary.toggle() end, "Toggle test summary window" },
    r = { function() neotest.run.run() end, "Run nearest test" },
    d = { function()
      local filetype = vim.bo.filetype
      if (filetype == "go") then
        require("dap-go").debug_test()
        return
      end
      ---@diagnostic disable-next-line: missing-fields
      neotest.run.run_last({ strategy = "dap" })
    end, "Debug last runned test" },
    o = { function() neotest.output.open() end, "Toggle output" },
    O = { function() neotest.output_panel.toggle() end, "Toggle output panel" },
    c = { function() neotest.output_panel.clear() end, "Clear output panel" },
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
