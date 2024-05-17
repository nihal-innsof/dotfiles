local status, colorPicker = pcall(require, "color-picker")
if (not status) then
  return
end

colorPicker.setup({})
