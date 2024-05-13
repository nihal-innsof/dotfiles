local status, diffView = pcall(require, "diffview")
if (not status) then return end

diffView.setup()
