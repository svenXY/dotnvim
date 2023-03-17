local servers_install = { "pyright", "jsonls", "lua_ls", "yamlls", "tsserver", "rust_analyzer", "terraformls" }
local servers_conf = { "pyright", "jsonls", "lua_ls", "yamlls", "tsserver", "rust_analyzer", "terraformls" }

require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = servers_install,
}

local lspconfig = require("lspconfig")
-- TypeScript
lspconfig.tsserver.setup {
  on_attach = require("user.lsp.handlers").on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}

for _, server in pairs(servers_conf) do
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
	if has_custom_opts then
	 	opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
	end
	lspconfig[server].setup(opts)
end

