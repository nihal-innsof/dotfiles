local status, dashboard = pcall(require, "dashboard")

if (not status) then
  return
end

local git_dashboard = require("git-dashboard-nvim").setup({})

dashboard.setup({
  theme = "doom",
  hide = {
    statusline = true,
    tabline = true,
    winbar = true,
  },
  config = {
    header = git_dashboard,
    --[[ header = {
      "                                   ",
      "                                   ",
      "                                   ",
      "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
      "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
      "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
      "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
      "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
      "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
      "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
      " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
      " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
      "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
      "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
      "                                   ",
    }, ]]
    center = {
      {
        icon = '󰈞  ',
        icon_hl = 'group',
        desc = 'Find Files',
        desc_hl = 'group',
        key = 'a',
        key_hl = 'group',
        action = 'Telescope find_files',
      },
      {
        icon = '  ',
        icon_hl = 'group',
        desc = 'Search Text',
        desc_hl = 'group',
        key = 'b',
        key_hl = 'group',
        action = 'Telescope live_grep',
      },
      {
        icon = '  ',
        icon_hl = 'group',
        desc = 'Recent Files',
        desc_hl = 'group',
        key = 'c',
        key_hl = 'group',
        action = 'Telescope oldfiles',
      },
      --[[ {
        icon = '  ',
        icon_hl = 'group',
        desc = 'Config',
        desc_hl = 'group',
        key = 'e',
        key_hl = 'group',
        action = 'edit ~/.config/nvim/init.lua',
      }, ]]
    },
  }
})
