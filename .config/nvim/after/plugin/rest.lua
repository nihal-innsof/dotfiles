vim.bo.formatexpr = "v:lua.vim.lsp.buf.formatting()"
vim.bo.formatprg = "jq"

--[[ vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json" },
  callback = function()
    vim.api.nvim_set_option_value("formatprg", "jq", { scope = 'local' })
  end,
}) ]]
