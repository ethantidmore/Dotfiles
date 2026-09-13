local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--vim.opt_local.textwidth = 100
--vim.opt_local.colorcolumn = "101"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 8
vim.opt.shiftwidth = 8
vim.opt_local.expandtab = false 
vim.opt.cursorline = true
vim.opt.wildmenu = true
vim.opt.termguicolors = true 
vim.opt.background = "dark"

require("lazy").setup({
	{ 
        "ellisonleao/gruvbox.nvim", 
        priority = 1000, 
        config = function()
            vim.cmd.colorscheme("gruvbox")
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = { theme = 'gruvbox' }
            })
        end
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            require("nvim-tree").setup({
                hijack_netrw = true, 
                actions = {
                    open_file = { quit_on_open = true }, 
                },
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
    },
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "bash", "c", "cpp", "go", "lua", "python" },
	callback = function()
        vim.treesitter.start()
    end,
})

if vim.g.neovide then
    vim.opt.guifont = "Hack Nerd Font:h14"
    vim.g.neovide_cursor_animation_length = 0   
    vim.g.neovide_scroll_animation_length = 0  
    vim.g.neovide_cursor_vfx_mode = ""        
    vim.g.neovide_refresh_rate = 240
end
