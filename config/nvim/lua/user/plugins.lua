return {
  -- Tema e aparência
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- garante que o tema seja carregado primeiro
    lazy = false,    -- carrega imediatamente
  },

  {
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPre", -- carrega quando abrir um buffer
  },

  -- Lazy.nvim (gerenciador de plugins)
  {
    "folke/lazy.nvim",
    lazy = true, -- isso é só para evitar recarregar sem necessidade
  },

  -- Explorador de arquivos
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "NvimTreeToggle", "NvimTreeFocus" }, -- só carrega ao usar o comando
  },

  -- Barra de status
  {
    "nvim-lualine/lualine.nvim",
    lazy = false, -- carrega de imediato
  },


  -- Autocompletar
  { "hrsh7th/nvim-cmp", event = "InsertEnter" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },

  -- LSP (inteligência de código)
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
  },

  -- Ajuda com atalhos
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup{}
      -- Exemplo de keymap
      vim.api.nvim_set_keymap('n', '<leader>ff', "<cmd>Telescope find_files<cr>", { noremap = true })
      vim.api.nvim_set_keymap('n', '<leader>fg', "<cmd>Telescope live_grep<cr>", { noremap = true })
    end
  },
}


