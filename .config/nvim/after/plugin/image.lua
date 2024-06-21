local status, image = pcall(require, "image")
if not status then
  return
end

image.setup({})
