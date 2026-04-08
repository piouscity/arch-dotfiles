vim.opt.termguicolors = true
vim.opt.background = 'light'
vim.opt.clipboard = 'unnamedplus'
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.api.nvim_create_autocmd('ColorScheme', {
	pattern = '*',
	callback = function()
		local bg = '#f5f1d7'
		local fg = '#38312f'

		vim.api.nvim_set_hl(0, 'Normal', { fg = fg, bg = bg })
		vim.api.nvim_set_hl(0, 'NormalNC', { fg = fg, bg = bg })
		vim.api.nvim_set_hl(0, 'SignColumn', { bg = bg })
		vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = bg, bg = bg })
	end,
})

vim.api.nvim_exec_autocmds('ColorScheme', { pattern = '*' })

return {
	'tpope/vim-sleuth',
}
