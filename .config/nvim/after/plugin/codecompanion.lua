local status, codecompanion = pcall(require, "codecompanion")
if not status then
  return
end

codecompanion.setup({
  adapters = {
    copilot = function()
      return require("codecompanion.adapters").extend("copilot", {
        schema = {
          model = {
            default = "claude-3.7-sonnet"
          }
        }
      })
    end
  }
})
