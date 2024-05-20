local status, rest = pcall(require, "rest-nvim")
if (not status) then return end

---@diagnostic disable-next-line: missing-fields
rest.setup({})
