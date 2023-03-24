local status_ok, statusline = pcall(require, "lualine")
if not status_ok then
    return
end

local devicons = require("nvim-web-devicons")

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn" },
    symbols = { error = " ", warn = " " },
    colored = true,
    update_in_insert = false,
    always_visible = true,
}

local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

local diff = {
    "diff",
    colored = false,
    symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
    cond = hide_in_width,
}

local progress = function()
    local current_line = vim.fn.line(".")
    local total_lines = vim.fn.line("$")
    local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
end

local fileicon = function()
    -- NvimTree
    if vim.bo.filetype == "NvimTree" then
        return ""
    end
    -- Outline
    if vim.bo.filetype == "Outline" then
        return ""
    end
    if devicons.get_icon_by_filetype(vim.bo.filetype) then
        return devicons.get_icon_by_filetype(vim.bo.filetype)
    end
    if devicons.get_icon(vim.bo.filetype) == nil then
        return ""
    end
end

local lsp_client = function()
    return " LSP [" .. vim.lsp.get_active_clients()[1].name .. "]"
end

statusline.setup {
    options = {
        theme = "auto",
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = { "alpha", "dashboard" },
    },
    sections = {
        lualine_a = {
            { "mode", separator = { left = '', right = '' } },
        },
        lualine_b = { diagnostics, lsp_client },
        lualine_c = {},
        lualine_x = { diff },
        lualine_y = { fileicon, 'encoding', progress },
        lualine_z = {
            { 'location', separator = { left = '', right = '' } },
        },
    },
    inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
    },
    tabline = {},
    extensions = {},
}
