-- Opções básicas de edição
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.wrap = true
vim.opt.mouse = "a"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.cursorline = true

-- Tecla líder
vim.g.mapleader = " "

-- Plugins básicos
local ok, nvim_tree = pcall(require, "nvim-tree")
if ok then nvim_tree.setup() end

local ok, lualine = pcall(require, "lualine")
if ok then lualine.setup() end

local ok, which_key = pcall(require, "which-key")
if ok then which_key.setup() end

local ok, colorizer = pcall(require, "colorizer")
if ok then colorizer.setup() end

-- Atalho para abrir/fechar o nvim-tree
vim.keymap.set("n", "<leader>e", function()
    local api_ok, api = pcall(require, "nvim-tree.api")
    if api_ok then
        api.tree.toggle()
    end
end, { desc = "Toggle NvimTree" })

-- Reindentação automática ao salvar
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function() vim.cmd("normal! gg=G") end,
})

-- Criar diretórios automaticamente
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        local dir = vim.fn.expand("<afile>:p:h")
        if vim.fn.isdirectory(dir) == 0 then
            vim.fn.mkdir(dir, "p")
        end
    end,
})

-- SPLITS & BUFFERS
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split Horizontal" })
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split Vertical" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move para esquerda" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move para baixo" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move para cima" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move para direita" })
vim.keymap.set("n", "<leader>q", ":close<CR>", { desc = "Fechar Split Atual" })
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "Fechar Buffer Atual" })
vim.keymap.set("n", "<leader>bo", ":%bd|e#|bd#<CR>", { desc = "Fechar Todos Buffers Exceto Atual" })

-- Alternar buffers com Tab/Shift+Tab
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Próximo Buffer" })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Buffer Anterior" })

-- Criar marks locais com leader
vim.keymap.set("n", "<leader>ma", "ma", { desc = "Criar mark a" })
vim.keymap.set("n", "<leader>mb", "mb", { desc = "Criar mark b" })


-- Abrir todas as imagens da pasta do arquivo atual (com feh mostrando nome da imagem)
local function open_images_in_dir()
  local dir = vim.fn.expand("%:p:h")  -- pega a pasta do arquivo atual
  vim.cmd('!feh -d -x "' .. dir .. '"')
end

-- Mapear tanto i quanto I para a mesma função
vim.keymap.set("n", "<leader>i", open_images_in_dir, { silent = true })
vim.keymap.set("n", "<leader>I", open_images_in_dir, { silent = true })


vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.lsp.start({
      name = "pyright",
      cmd = { "pyright-langserver", "--stdio" },
      root_dir = vim.fn.getcwd(),
    })
  end,
})

--vim.keymap.set("n", "<leader>c", function() require("oklch-color-picker").pick_under_cursor() end, { silent = true })
--
vim.keymap.set("n", "<leader>col", function()
  require("oklch-color-picker").pick_under_cursor()
end, { silent = true, desc = "Color pick under cursor" })


-- Normal mode: Ctrl + / comenta a linha atual
vim.keymap.set("n", "<C-_>", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Comentar linha atual" })

-- Visual mode: Ctrl + / comenta seleção
vim.keymap.set("v", "<C-_>", function()
  require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, { desc = "Comentar seleção" })


vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- Formatar automaticamente com LSP ao salvar
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local clients = vim.lsp.get_active_clients({ bufnr = vim.api.nvim_get_current_buf() })
    if #clients == 0 then
      return
    end
    vim.lsp.buf.format({ async = false })
  end,
})
