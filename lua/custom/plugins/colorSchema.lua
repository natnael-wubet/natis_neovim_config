return {
    {
        "navarasu/onedark.nvim",
        priority = 1000,
        config = function()
            -- Enable 24-bit RGB colors
            vim.opt.termguicolors = true
            
            -- Configure the colorscheme first
            require('onedark').setup({
                style = 'dark',
                transparent = true,
                term_colors = true,
            })
            
            -- Load the colorscheme
            require('onedark').load()
            
            -- Force transparency after colorscheme loads
            vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", ctermbg = "NONE" })
            vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE", ctermbg = "NONE" })
            vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE", ctermbg = "NONE" })
            vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE", ctermbg = "NONE" })
            vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE", ctermbg = "NONE" })
            
            -- Additional terminal-specific settings
            vim.opt.background = "dark"
        end,
    },
}
