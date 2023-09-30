require("onedark").setup({
    style = 'warmer',
	code_style = {
        comments = 'italic',
        keywords = 'bold',
        functions = 'bold',
        strings = 'none',
        variables = 'none'
    },
	lualine = {
        transparent = true, -- lualine center bar transparency
    },
	
})

local colorscheme = "onedark"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
