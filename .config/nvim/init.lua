vim.g.mapleader = " "

vim.opt.termguicolors = true
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("user.plugins")

require("user.settings")

require("user.theme")

vim.keymap.set({ "n", "v" }, "y", '"+y')
vim.keymap.set("n", "yy", '"+yy')

vim.keymap.set("n", "p", '"+p')
vim.keymap.set("n", "P", '"+P')

vim.keymap.set("v", "p", '"+p')
vim.keymap.set("v", "P", '"+P')

vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })
