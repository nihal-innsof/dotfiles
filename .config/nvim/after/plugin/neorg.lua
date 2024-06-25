local status, neorg = pcall(require, "neorg")
if not status then
  return
end

neorg.setup({
  load = {
    ["core.defaults"] = {},
    ["core.dirman"] = {
      config = {
        workspaces = {
          knowledge_base = "~/Documents/knowledge_base/"
        }
      }
    }
  }
})
