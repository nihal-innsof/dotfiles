local status, codecompanion = pcall(require, "codecompanion")
if not status then
  return
end

codecompanion.setup({
  strategies = {
    chat = {
      adapter = "copilot",
      slash_commands = {
        codebase = require("vectorcode.integrations").codecompanion.chat.make_slash_command(),
      },
      tools = {
        vectorcode = {
          description = "Run VectorCode to retrieve the project context.",
          callback = require("vectorcode.integrations").codecompanion.chat.make_tool(),
        }
      }
    }
  },
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
