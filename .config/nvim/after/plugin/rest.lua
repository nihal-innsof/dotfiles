local status, rest = pcall(require, "rest-nvim")
if (not status) then return end

rest.setup({
  result_split_horizontal = false,
  result_split_in_place = true,
  stay_in_current_window_after_split = true,
  skip_ssl_verification = false,
  encode_url = true,
  highlight = {
    enabled = true,
    timeout = 150,
  },
  result = {
    show_url = true,
    show_curl_command = true,
    show_http_info = true,
    show_headers = true,
    show_statistics = false,
    formatters = {
      json = "jq",
      html = function(body)
        return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
      end
    },
  },
  jump_to_request = false,
  env_file = '.env',
  custom_dynamic_variables = {},
  yank_dry_run = true,
  search_back = true,
})
