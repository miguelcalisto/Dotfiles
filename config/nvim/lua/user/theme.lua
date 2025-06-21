-- Configuração do tema Catppuccin
require("catppuccin").setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  background = {
    light = "latte",
    dark = "mocha",
  },
  integrations = {
    colorizer = false,
  }
})

-- Aplica o tema
vim.cmd.colorscheme("catppuccin")

-- Personalizações visuais (transparência e cores de destaque)
vim.api.nvim_set_hl(0, "Normal",         { bg = "NONE", ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "NormalNC",       { bg = "NONE", ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "EndOfBuffer",    { bg = "NONE", ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "LineNr",         { fg = "#f9e2af", bg = "NONE" })
vim.api.nvim_set_hl(0, "CursorLineNr",   { fg = "#facc15", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "CursorLine",     { bg = "#313244" })

-- Ativa o colorizer para exibir cores inline em arquivos CSS, etc.
require("colorizer").setup({
  "*", -- aplica a todos os arquivos
}, {
  RGB      = true,
  RRGGBB   = true,
  names    = false,
  RRGGBBAA = true,
  rgb_fn   = true,
  hsl_fn   = true,
  css      = true,
  css_fn   = true,
})

