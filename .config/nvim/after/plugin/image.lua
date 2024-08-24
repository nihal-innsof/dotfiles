---@diagnostic disable: missing-fields
local status, image = pcall(require, "image")
if not status then
  return
end

image.setup({
  backend = "kitty",
  integrations = {
    markdown = {
      enabled = true
    },
    neorg = {
      enabled = true
    },
  },
  window_overlap_clear_enabled = false,
  editor_only_render_when_focused = false,
  tmux_show_only_in_active_window = true
})
