-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	cmd = "Neotree",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	init = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- Create custom command to handle :edit .
		vim.api.nvim_create_user_command("OpenDirTree", function()
			local path = vim.fn.expand("%:p:h")  -- Get directory of current file
			vim.cmd("Neotree position=right dir=" .. path)
		end, {})

		-- Override the default :edit . behavior
		vim.api.nvim_create_autocmd("CmdlineLeave", {
			callback = function()
				local cmd = vim.fn.getcmdline()
				if cmd:match("^e%s+%.") or cmd:match("^edit%s+%.") then
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), 'n', true)
					vim.cmd("OpenDirTree")
					return true
				end
			end
		})
	end,
	config = function()
		require("neo-tree").setup({
			close_if_last_win = false,
			enable_git_status = false,
			enable_diagnostics = false,
			filesystem = {
				filtered_items = {
					visible = false,
					hide_dotfiles = true,
					hide_gitignored = true,
					never_show = { ".git", "node_modules", ".cache" },
				},
				follow_current_file = { enabled = true },
				use_libuv_file_watcher = true,
				scan_mode = "fast",
			},
			window = {
				position = "right",
				width = 30,
				mappings = {
					["<space>"] = "none",
				},
			},
		})
	end,
}
--    require('neo-tree').setup {}

