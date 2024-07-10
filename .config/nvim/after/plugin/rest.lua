local status, rest = pcall(require, "rest-nvim")
if (not status) then return end

rest.setup({
  result = {
    behavior = {
      formatters = {
        plain = "jq"
      }
    }
  }
})

require("telescope").load_extension("rest")
