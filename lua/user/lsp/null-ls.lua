local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- formatting
local formatting = null_ls.builtins.formatting
-- diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- Code Actions
local code_actions = null_ls.builtins.code_actions

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }
require("lspconfig").clangd.setup({ capabilities = capabilities })

null_ls.setup({
	debug = true,
	sources = {
		-- Formatting
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		formatting.clang_format,
		formatting.google_java_format,
		formatting.prettier,
		formatting.fixjson,
		formatting.beautysh,
		-- Code Actions
		code_actions.eslint_d,
		code_actions.ltrs,
		code_actions.proselint,
		code_actions.refactoring,
		-- Diagnostics
		diagnostics.cfn_lint,
		diagnostics.checkstyle.with({ extra_args = { "-c", "/google_checks.xml" } }),
		diagnostics.cpplint,
		diagnostics.commitlint,
		diagnostics.eslint_d,
		diagnostics.flake8,
		diagnostics.golangci_lint,
		diagnostics.textlint,
		diagnostics.shellcheck,
		diagnostics.selene,
		diagnostics.standardrb,
		diagnostics.vint,
	},
})
