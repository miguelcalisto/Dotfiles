-- Bootstrap Lazy.nvim

vim.g.mapleader = " "  -- Definindo o espaço como a tecla líder

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

-- Carregar plugins com Lazy
require("lazy").setup("user.plugins")

-- Configurações do Neovim
require("user.settings")

-- Tema e aparência
require("user.theme")

-- Copiar com y direto pro clipboard
vim.keymap.set({'n', 'v'}, 'y', '"+y')
vim.keymap.set('n', 'yy', '"+yy')

-- Colar com p direto do clipboard
vim.keymap.set('n', 'p', '"+p')
vim.keymap.set('n', 'P', '"+P')

-- Também funciona no modo visual
vim.keymap.set('v', 'p', '"+p')
vim.keymap.set('v', 'P', '"+P')


vim.api.nvim_set_keymap('n', '<leader>ff', "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>fg', "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })
