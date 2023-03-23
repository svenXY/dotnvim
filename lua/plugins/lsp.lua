return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- mason stuff
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    -- lsp status updates
    "j-hui/fidget.nvim",
    "onsails/lspkind.nvim",
    "tamago324/nlsp-settings.nvim", -- language server settings defined in json for
    "jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
  },
  config =  function ()
    local status_ok, _ = pcall(require, "lspconfig")
    if not status_ok then
      return
    end

    require "user.lsp.configs"
    require("user.lsp.handlers").setup()
    require "user.lsp.null-ls"
    require "user.lsp.rust_tools"
  end
}
