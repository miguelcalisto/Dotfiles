-- Opções básicas de edição
vim.opt.number = true                -- Mostra número das linhas
vim.opt.relativenumber = false      -- Não usa numeração relativa
vim.opt.wrap = true                  -- Quebra de linha automática
vim.opt.mouse = "a"                 -- Ativa mouse em todos os modos
vim.opt.tabstop = 4                 -- Número de espaços por <Tab>
vim.opt.shiftwidth = 4              -- Número de espaços para indentação automática
vim.opt.expandtab = true            -- Converte <Tab> em espaços
vim.opt.autoindent = true           -- Mantém indentação de linha anterior
vim.opt.smartindent = true          -- Indentação automática inteligente
vim.opt.termguicolors = true        -- Habilita cores verdadeiras no terminal
vim.opt.cursorline = true           -- Destaca a linha do cursor

-- Tecla líder
vim.g.mapleader = " "

-- Configurações de plugins
-- Para evitar erros, carregue plugins só se estiverem instalados

-- nvim-tree setup
local ok, nvim_tree = pcall(require, "nvim-tree")
if ok then
  nvim_tree.setup()
else
  vim.notify("nvim-tree not found", vim.log.levels.WARN)
end

-- lualine setup
local ok, lualine = pcall(require, "lualine")
if ok then
  lualine.setup()
else
  vim.notify("lualine not found", vim.log.levels.WARN)
end

-- which-key setup
local ok, which_key = pcall(require, "which-key")
if ok then
  which_key.setup()
else
  vim.notify("which-key not found", vim.log.levels.WARN)
end

-- colorizer setup
local ok, colorizer = pcall(require, "colorizer")
if ok then
  colorizer.setup()
else
  vim.notify("colorizer not found", vim.log.levels.WARN)
end

-- Atalho para abrir/fechar o nvim-tree
vim.keymap.set("n", "<leader>e", function()
  local api_ok, api = pcall(require, "nvim-tree.api")
  if api_ok then
    api.tree.toggle()
  else
    vim.notify("nvim-tree.api not found", vim.log.levels.WARN)
  end
end, { desc = "Toggle NvimTree" })

-- Reindentação automática ao salvar (formatar arquivo)
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.cmd("normal! gg=G")
  end,
})

