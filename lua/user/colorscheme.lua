require('onedark').setup{
	style = 'warmer',
	ending_tildes = false,
	lualine = {
        transparent = true, -- lualine center bar transparency
    },
}

local colorscheme = "onedark"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
