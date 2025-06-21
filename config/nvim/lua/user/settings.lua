-- Opções básicas de edição
vim.opt.number = true                -- Mostra número das linhas
vim.opt.relativenumber = false      -- Não usa numeração relativa
vim.opt.wrap = true                 -- Quebra de linha automática
vim.opt.mouse = "a"                 -- Ativa mouse em todos os modos
vim.opt.tabstop = 4                 -- Número de espaços por <Tab>
vim.opt.shiftwidth = 4              -- Número de espaços para indentação automática
vim.opt.expandtab = true            -- Converte <Tab> em espaços
vim.opt.autoindent = true           -- Mantém indentação de linha anterior
vim.opt.smartindent = true          -- Identação automática inteligente
vim.opt.termguicolors = true        -- Habilita cores verdadeiras no terminal
vim.opt.cursorline = true           -- Destaca a linha do cursor

-- Tecla líder
vim.g.mapleader = " "

-- Configurações de plugins
require("nvim-tree").setup()

require("lualine").setup()


require("which-key").setup{}

require("colorizer").setup()

-- Atalho para abrir/fechar o nvim-tree
vim.keymap.set("n", "<leader>e", function()
  require("nvim-tree.api").tree.toggle()
end, { desc = "Toggle NvimTree" })




-- Reindentação automática ao salvar
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.cmd("normal! gg=G")
  end,
})



