local status, onedark = pcall(require, "onedark")

require("onedark.palette")

if (not status) then
  return
end

onedark.setup({
  style = "deep",
  transparent = true,
  toggle_style_key = "<leader>ts",
  code_style = {
    keywords = 'bold',
    strings = 'none',
    variables = 'none',
  },
  highlights = {
    -- ["DashboardHeader"] = { fg = "#e3e3e3" },
    ["DashboardFooter"] = { fg = "#e3e3e3" },
    ["DashboardShortCut"] = { fg = "white" },
    ["NormalFloat"] = { bg = "NONE" },
    ["HoverBorder"] = { bg = "NONE" },
    ["FloatBorder"] = { bg = "NONE" }
  }
})

onedark.load()
