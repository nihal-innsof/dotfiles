local status, dap_go = pcall(require, "dap-go")
if (not status) then
  return
end

dap_go.setup {
  dap_configurations = {
    {
      type = "go",
      name = "Attach remote",
      mode = "remote",
      request = "attach",
    },
  },
}
