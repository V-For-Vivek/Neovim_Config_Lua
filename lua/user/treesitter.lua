local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    vim.notify("Neovim Treesitter Status Not Ok !")
    return
end

configs.setup({
    ensure_installed = {
        "c",
        "cpp",
        "python",
        "java",
        "lua",
        "vim",
        "bash",
        "javascript",
        "markdown",
        "markdown_inline",
        "json"
    },
    auto_install = true,
    highlight = {
        enable = true, -- false will disable the whole extension
    },
    autopairs = {
        enable = true,
    },
    indent = { enable = true, disable = { "python", "css" } },
    rainbow = {
        enable = true,
        disable = { "jsx" },
        query = 'rainbow-parens',
        strategy = require 'ts-rainbow.strategy.global',
    },
    context_commentstring = {
        enable = true
    },
})
