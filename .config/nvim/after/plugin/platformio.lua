require('platformio').setup({
  lsp = "clang" --default: ccls, other option: clangd
  -- If you pick clangd, it also creates compile_commands.json
})
