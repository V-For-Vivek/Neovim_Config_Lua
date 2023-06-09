require("onedarkpro").setup({
	styles = {
		-- For example, to apply bold and italic, use "bold,italic"
		types = "bold", -- Style that is applied to types
		methods = "bold", -- Style that is applied to methods
		numbers = "NONE", -- Style that is applied to numbers
		strings = "NONE", -- Style that is applied to strings
		comments = "italic", -- Style that is applied to comments
		keywords = "bold", -- Style that is applied to keywords
		constants = "NONE", -- Style that is applied to constants
		functions = "bold", -- Style that is applied to functions
		operators = "NONE", -- Style that is applied to operators
		variables = "NONE", -- Style that is applied to variables
		parameters = "NONE", -- Style that is applied to parameters
		conditionals = "bold", -- Style that is applied to conditionals
		virtual_text = "NONE", -- Style that is applied to virtual text
	},
	highlights = {
		PmenuSel = { fg = "#c678dd" },
	},
	options = {
		cursorline = true,
		terminal_colors = true,
	},
})

local colorscheme = "onedark"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
