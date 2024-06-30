local status, neorg = pcall(require, "neorg")
if (not status) then
  return
end

---@diagnostic disable-next-line: missing-fields
neorg.setup({
  load = {
    ["core.defaults"] = {},
    ["core.dirman"] = {
      config = {
        default_workspace = "kBase",
        workspaces = {
          kBase = "~/Documents/kBase",
        }
      }
    },
    ["core.concealer"] = {},
    ["core.syntax"] = {},
  }
})
