require("lemon")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { 'nvim-treesitter/nvim-treesitter',  run = ":TSUpdate" },
    { 'nvim-telescope/telescope.nvim',    tag = '1.1.6',       dependencies = { "nvim-lua/plenary.nvim" } },
    { "catppuccin/nvim",                  name = "catppuccin", priority = 1000 },
    { "ThePrimeagen/harpoon",             branch = "harpoon2", dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" } },
    { "mbbill/undotree" },
    { "/tpope/vim-fugitive" },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },
    {
        'https://github.com/fresh2dev/zellij.vim.git',
        lazy = false,
    }
})

vim.cmd("colorscheme catppuccin-macchiato")
