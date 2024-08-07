---@diagnostic disable: missing-fields, undefined-field
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- 'wbthomason/packer.nvim',
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
  -- LSP
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'glepnir/lspsaga.nvim' },            -- lsp ui
      { 'onsails/lspkind-nvim' },            -- vscode like pictograms
      { 'jose-elias-alvarez/null-ls.nvim' }, -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
      -- Autocompletion
      {
        'hrsh7th/nvim-cmp',
        opts = function(_, opts)
          opts.sources = opts.sources or {}
          table.insert(opts.sources, {
            name = "lazydev",
            group_index = 0, -- set group index to 0 to skip loading LuaLS completions
          })
        end,
      },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  },
  -- Theme
  {
    'svrana/neosolarized.nvim',
    dependencies = { 'tjdevries/colorbuddy.nvim' },
    lazy = true
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },
  "nvim-treesitter/nvim-treesitter-context",
  -- Nice to haves
  {
    "numToStr/Comment.nvim",
    config = function()
      require('Comment').setup({
        opleader = {
          block = "<S-A-a>"
        }
      })
    end
  },
  {
    'stevearc/dressing.nvim',
  },
  "github/copilot.vim",
  "j-hui/fidget.nvim",
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = true,      -- show icons in the signs column
      sign_priority = 8, -- sign priority
      -- keywords recognized as todo comments
      keywords = {
        FIX = {
          icon = " ", -- icon used for the sign, and in search results
          color = "error", -- can be a hex color, or a named color (see below)
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
          -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = "󰅒 ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = "󱜾 ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
      gui_style = {
        fg = "NONE",                     -- The gui style to use for the fg highlight group.
        bg = "BOLD",                     -- The gui style to use for the bg highlight group.
      },
      merge_keywords = true,             -- when true, custom keywords will be merged with the defaults
      highlight = {
        multiline = true,                -- enable multine todo comments
        multiline_pattern = "^.",        -- lua pattern to match the next multiline from the start of the matched keyword
        multiline_context = 10,          -- extra lines that will be re-evaluated when changing a line
        before = "",                     -- "fg" or "bg" or empty
        keyword = "wide",                -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
        after = "fg",                    -- "fg" or "bg" or empty
        pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
        comments_only = true,            -- uses treesitter to match keywords in comments only
        max_line_len = 400,              -- ignore lines longer than this
        exclude = {},                    -- list of file types to exclude highlighting
      },
      colors = {
        error = { "#DC2626" },
        warning = { "#FBBF24" },
        info = { "#2563EB" },
        hint = { "#10B981" },
        default = { "#7C3AED" },
        test = { "#FF00FF" }
      },
      search = {
        command = "rg",
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        pattern = [[\b(KEYWORDS):]], -- ripgrep regex
      },
    }
  },
  -- Git
  {
    "tpope/vim-fugitive",
    lazy = true,
  },
  {
    "lewis6991/gitsigns.nvim",
  },
  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    lazy = true,
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
  },
  -- Statusline
  "nvim-lualine/lualine.nvim",
  -- Buffer
  "akinsho/nvim-bufferline.lua",
  -- Toggleterm
  {
    'akinsho/toggleterm.nvim',
    lazy = true,
    version = "*",
    config = function()
      require("toggleterm").setup(
        {
          size = 10,
          open_mapping = [[<C-\>]],
          hide_numbers = true,
          shade_filetypes = {},
          shade_terminals = true,
          shading_factor = 2,
          start_in_insert = true,
          insert_mappings = true,
          persist_size = true,
          close_on_exit = true,
          direction = 'float',
          float_opts = {
            border = "curved",
            winblend = 0,
            highlights = {
              border = "Normal",
              background = "Normal"
            }
          }
        }
      )
    end,
  },
  -- Autopairs
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
  -- Highligt Color Codes
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },
  -- Live Server
  {
    lazy = true,
    'barrett-ruth/live-server.nvim',
    config = function()
      require('live-server').setup()
    end,
  },
  -- Debugger
  {
    lazy = true,
    'mfussenegger/nvim-dap',
    dependencies = {
      'nvim-telescope/telescope-dap.nvim',
      'rcarriga/nvim-dap-ui',
      { "mxsdev/nvim-dap-vscode-js", module = { "dap-vscode-js" } },
      {
        "microsoft/vscode-node-debug2",
        -- opt = true,
        -- run = "npm install && npm run build"

      },
      {
        'theHamsta/nvim-dap-virtual-text',
        config = function()
          require('nvim-dap-virtual-text').setup({})
        end
      }
    },
  },
  { "nvim-neotest/nvim-nio" },
  -- Which key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  -- Dashboard
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    dependencies = {
      { 'juansalvatore/git-dashboard-nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
      { 'nvim-tree/nvim-web-devicons' },
    }
  },
  -- Flutter
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
  },
  -- Flutter Snippets
  "RobertBrunhage/flutter-riverpod-snippets",
  "Neevash/awesome-flutter-snippets",
  -- Color highlight in files
  {
    "mrshmllow/document-color.nvim",
    config = function()
      require("document-color").setup {
        mode = "background", -- background | foreground | single
      }
    end
  },
  -- Golang Debugger
  {
    "leoluz/nvim-dap-go"
  },
  -- Database Management
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod',                     lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql', 'tsql' }, lazy = true },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  {
    'navarasu/onedark.nvim'
  },
  -- Lua
  {
    "folke/zen-mode.nvim",
    opts = {
    }
  },
  -- PGSQL
  { 'lifepillar/pgsql.vim' },
  -- Trouble
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  -- Golang extras
  {
    "olexsmir/gopher.nvim",
    dependencies = { -- dependencies
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    }
  },
  -- Neotest
  {
    lazy = true,
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      'sidlatau/neotest-dart',
      "nvim-neotest/neotest-go",
    }
  },
  -- DiffView
  {
    lazy = true,
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  --- Undotree
  {
    "mbbill/undotree",
  },
  -- Octo
  {
    lazy = true,
    'pwntester/octo.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
  },
  -- NUI
  {
    "grapp-dev/nui-components.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim"
    }
  },

  -- Custom Parameters (with defaults)
  {
    "David-Kunz/gen.nvim",
    opts = {
      model = "zephyr",       -- The default model to use.
      host = "localhost",     -- The host running the Ollama service.
      port = "11434",         -- The port on which the Ollama service is listening.
      display_mode = "split", -- The display mode. Can be "float" or "split".
      show_prompt = false,    -- Shows the Prompt submitted to Ollama.
      show_model = true,      -- Displays which model you are using at the beginning of your chat session.
      no_auto_close = true,   -- Never closes the window automatically.
      init = function(_) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
      -- Function to initialize Ollama
      command = function(options)
        return "curl --silent --no-buffer -X POST http://" ..
            options.host .. ":" .. options.port .. "/api/generate -d $body"
      end,
      -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
      -- This can also be a command string.
      -- The executed command must return a JSON object with { response, context }
      -- (context property is optional).
      -- list_models = '<omitted lua function>', -- Retrieves a list of model names
      debug = false -- Prints errors and the command which is run.
    }
  },

  -- Tmux integration
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    "lervag/vimtex",
    lazy = false,     -- we don't want to lazy load VimTeX
    init = function() -- VimTeX configuration goes here
    end
  },
  -- lazy.nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
      --
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      {
        "rcarriga/nvim-notify",
        opts = {
          background_colour = "#333333",
        }
      }
    }
  },
  -- Rest client
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    dependencies = { "luarocks.nvim" },
    config = function()
      require("rest-nvim").setup()
    end,
  },
  {
    lazy = false,
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration
      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
      -- "ibhagwan/fzf-lua",              -- optional
    },
    opts = {},
  },
  {
    "vhyrro/luarocks.nvim",
    priority = 1001, -- this plugin needs to run before anything else
    config = true,
    opts = {
      rocks = { "magick", --[[ "lua-curl", ]] "nvim-nio", "mimetypes", "xml2lua" },
    },
  },
  {
    "3rd/image.nvim",
    dependencies = { "luarocks.nvim" },
    opts = {}
  },
  -- Neorg
  {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim" },
    lazy = false,  -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.dirman"] = {
          config = {
            default_workspace = "knowledge_base",
            workspaces = {
              knowledge_base = "~/Documents/knowledge_base/"
            }
          }
        },
        ["core.syntax"] = {},
        ["core.concealer"] = {},
      }
    },
    config = true,
  },
  -- Buffer based file manager
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "echasnovski/mini.icons" },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  },
  -- My Plugins
  {
    dir = "~/dev/nvim/n1h41",
    config = function()
      require("n1h41").setup()
    end
  },
}

require('lazy').setup(plugins, {})
