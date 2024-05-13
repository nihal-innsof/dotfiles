local status, lsp_zero = pcall(require, "lsp-zero")

if (not status) then
  return
end

lsp_zero.preset('recommended')

lsp_zero.ensure_installed({ 'tsserver', 'eslint', 'lua_ls', "gopls", "html", "cssls", "tailwindcss" })

local cmp = require('cmp')

local cmp_mappings = lsp_zero.defaults.cmp_mappings({
  ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  ["<C-f>"] = cmp.mapping.scroll_docs(4),
  ["<C-y>"] = cmp.mapping.complete(),
  ["<C-e>"] = cmp.mapping.abort(),
  ["<CR>"] = cmp.mapping.confirm({
    select = false
  })
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

local protocol = require('vim.lsp.protocol')

protocol.CompletionItemKind = {
  '', -- Text
  '󰊕', -- Method
  '󰊕', -- Function
  '󰊕', -- Constructor
  '', -- Field
  '', -- Variable
  '', -- Class
  '󰜰', -- Interface
  '󰏗', -- Module
  '', -- Property
  '', -- Unit
  '󰎠', -- Value
  '', -- Enum
  '', -- Keyword
  '󰘍', -- Snippet
  '', -- Color
  '', -- File
  '󰆑', -- Reference
  '', -- Folder
  '', -- EnumMember
  '', -- Constant
  '', -- Struct
  '', -- Event
  'ﬦ', -- Operator
  '', -- TypeParameter
}

local lspkind = require('lspkind')

lsp_zero.setup_nvim_cmp({
  mapping = cmp_mappings,
  sources = { {
    name = 'nvim_lsp'
  }, {
    name = 'path'
  }, {
    name = 'luasnip'
  }, {
    name = 'buffer',
    keyword_length = 5
  }, {
    name = 'vim-dadbod-completion',
  } },
  formatting = {
    fields = { 'abbr', 'kind', 'menu' },
    format = lspkind.cmp_format({
      mode = 'symbol_text',  -- show only symbol annotations
      maxwidth = 50,         -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      before = function(_, vim_item)
        vim_item.kind = string.format('%s %s', lspkind.presets.default[vim_item.kind], vim_item.kind)
        vim_item.menu = ""
        return vim_item
      end
    })
  },
})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  -- Mappings.
  local opts = { noremap = true, silent = true }

  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)

  if client.server_capabilities.colorProvider then
    require("document-color").buf_attach(bufnr)
  end
end



local capabilities = require('cmp_nvim_lsp').default_capabilities()

lsp_zero.on_attach(on_attach)

capabilities.textDocument.colorProvider = {
  dynamicRegistration = true
}

lsp_zero.capabilities = capabilities


lsp_zero.configure('tsserver', {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
})

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
})

local flutter = require('flutter-tools')

-- alternatively you can override the default configs
flutter.setup {
  ui = {
    border = "rounded",
    notification_style = 'plugin'
  },
  decorations = {
    statusline = {
      app_version = true,
      device = true,
      project_config = true,
    }
  },

  debugger = {          -- integrate with nvim dap + install dart code debugger
    enabled = false,
    run_via_dap = true, -- use dap instead of a plenary job to run flutter apps
    exception_breakpoints = { "always" }
  },
  flutter_path = "/home/nihal/flutter/bin/flutter", -- <-- this takes priority over the lookup
  fvm = false,                                      -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
  widget_guides = {
    enabled = true,
  },
  dev_log = {
    enabled = true,
    notify_errors = false, -- if there is an error whilst running then notify the user
    open_cmd = "tabnew",   -- command to use to open the log buffer
  },
  dev_tools = {
    autostart = true,          -- autostart devtools server if not detected
    auto_open_browser = false, -- Automatically opens devtools in the browser
  },
  outline = {
    open_cmd = "50vnew", -- command to use to open the outline buffer
    auto_open = false    -- if true this will open the outline automatically when it is first populated
  },
  lsp = {
    color = { -- show the derived colours for dart variables
      enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
      background = true, -- highlight the background
      background_color = { r = 19, g = 17, b = 24 }, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
      foreground = true, -- highlight the foreground
      virtual_text = true, -- show the highlight using virtual text
      virtual_text_str = "■", -- the virtual text character to highlight
    },
    on_attach = on_attach,
    capabilities = capabilities, -- e.g. lsp_status capabilities
    settings = {
      showTodos = true,
      completeFunctionCalls = true,
      analysisExcludedFolders = {
        "/home/nihal/.pub-cache/hosted/",
        "/home/nihal/flutter/",
      },
      renameFilesWithClasses = "prompt", -- "always"
      enableSnippets = true,
      updateImportsOnRename = true,      -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
    }
  }
}

local util = require("lspconfig.util")

lsp_zero.configure('gopls', {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.mod", ".git"),
})

lsp_zero.configure('html', {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html", "css", "javascript", "typescript", "typescriptreact", "typescript.tsx", "templ" },
})

lsp_zero.configure('htmx', {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html", "templ" },
})

lsp_zero.configure('tailwindcss', {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html", "css", "javascript", "typescript", "typescriptreact", "typescript.tsx", "templ" },
  init_options = {
    userLanguages = {
      templ = "html"
    }
  }
})

lsp_zero.configure('emmet_language_server', {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact", "templ" },
})

lsp_zero.setup()

require("fidget").setup({})
