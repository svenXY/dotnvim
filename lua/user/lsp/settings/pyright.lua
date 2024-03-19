return {
  cmd = {'pyright-langserver', '--stdio'},
  cmd_env = { LANG = "en_US.UTF-8" },
  filetypes = { "python" },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true
      }
    }
  },
  single_file_support = true,
}
