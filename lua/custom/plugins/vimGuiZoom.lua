return {
	"drzel/vim-gui-zoom",
	config = function()
		vim.opt.guifont = "DejaVuSansMono Nerd Font:h16"

		-- Map Ctrl-+ and Ctrl-- to zoom in and out
		vim.api.nvim_set_keymap('n', '<C-+>', ':ZoomIn<CR>', { noremap = true, silent = true })
		vim.api.nvim_set_keymap('n', '<C-->', ':ZoomOut<CR>', { noremap = true, silent = true })
	end
}
