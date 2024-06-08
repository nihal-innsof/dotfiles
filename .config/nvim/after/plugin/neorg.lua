local status, neorg = pcall(require, "neorg")
if (not status) then
  return
end

---@diagnostic disable-next-line: missing-fields
neorg.setup({})
