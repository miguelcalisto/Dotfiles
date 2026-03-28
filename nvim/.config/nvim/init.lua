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

require("user.cmp")

require("user.lsp")

vim.keymap.set({ "n", "v" }, "y", '"+y')
vim.keymap.set("n", "yy", '"+yy')
vim.keymap.set("n", "p", '"+p')
vim.keymap.set("n", "P", '"+P')
vim.keymap.set("v", "p", '"+p')
vim.keymap.set("v", "P", '"+P')

-- Telescope keymaps
-- vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { silent = true })
-- vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { silent = true })
-- vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { silent = true })
-- vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { silent = true })
--
--
-- FZF keymaps
vim.keymap.set("n", "<leader>ff", function()
    require("fzf-lua").files()
end, { silent = true, desc = "Find Files" })

vim.keymap.set("n", "<leader>fg", function()
    require("fzf-lua").live_grep()
end, { silent = true, desc = "Live Grep" })

vim.keymap.set("n", "<leader>fr", function()
    require("fzf-lua").oldfiles()
end, { silent = true, desc = "Recent Files" })

vim.keymap.set("n", "<leader>fb", function()
    require("fzf-lua").buffers()
end, { silent = true, desc = "Buffers" })

vim.keymap.set("n", "<leader>fp", function()
    require("fzf-lua-lazy").search()
end, { desc = "Lazy Plugins" })

-- Color picker
vim.keymap.set("n", "<leader>col", function()
    require("oklch-color-picker").pick_under_cursor()
end, { desc = "Pick color under cursor", silent = true })

-- Comentário
vim.keymap.set("n", "<C-_>", function()
    require("Comment.api").toggle.linewise.current()
end, { desc = "Comentar linha atual" })
vim.keymap.set("v", "<C-_>", function()
    require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, { desc = "Comentar seleção" })

vim.keymap.set("n", "<leader>a", "ggVG", { desc = "Selecionar tudo" })

-- vim.cmd([[
-- highlight TelescopeBorder guifg=#A3BE8C guibg=#1E222A
-- highlight TelescopePromptBorder guifg=#88C0D0 guibg=#1E222A
-- highlight TelescopeResultsBorder guifg=#E5E9F0 guibg=#1E222A
-- highlight TelescopePreviewBorder guifg=#B48EAD guibg=#1E222A
-- ]])

-- vim.cmd([[
-- highlight TelescopeBorder guifg=#FF79C6 guibg=#282A36
-- highlight TelescopePromptBorder guifg=#BD93F9 guibg=#282A36
-- highlight TelescopeResultsBorder guifg=#8BE9FD guibg=#282A36
-- highlight TelescopePreviewBorder guifg=#50FA7B guibg=#282A36
-- highlight TelescopePromptCounter guifg=#FF79C6 guibg=#282A36
--
--
-- highlight TelescopeNormal guibg=#282A36
-- highlight TelescopePromptNormal guibg=#282A36
-- highlight TelescopeResultsNormal guibg=#282A36
-- highlight TelescopePreviewNormal guibg=#282A36
-- ]])

require("nvim-tree").setup({
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
})

-- vim.keymap.set("n", "<leader>cd", ":lcd %:p:h<CR>", { desc = "CD para pasta do arquivo" })
--
vim.opt.autochdir = true
