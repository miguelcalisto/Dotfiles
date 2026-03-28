vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.wrap = true
vim.opt.cursorline = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.mouse = "a"
vim.opt.termguicolors = true

-- NvimTree
local ok, nvim_tree = pcall(require, "nvim-tree")
if ok then
    nvim_tree.setup({
        view = { width = 30, side = "left" },
        renderer = { icons = { show = { git = true, folder = true, file = true } } },
        filters = { dotfiles = false },
        git = { enable = true },
    })
end
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")

-- Splits & Buffers
vim.keymap.set("n", "<leader>sh", "<cmd>split<CR>")
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<CR>")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<leader>q", "<cmd>close<CR>")
vim.keymap.set("n", "<leader>bd", "<cmd>bd<CR>")
vim.keymap.set("n", "<leader>bo", ":%bd|e#|bd#<CR>")

vim.keymap.set("n", "<leader>ma", "ma")
vim.keymap.set("n", "<leader>mb", "mb")

local function open_images_in_dir()
    local dir = vim.fn.expand("%:p:h")
    vim.cmd('!feh -d -x "' .. dir .. '"')
end
vim.keymap.set("n", "<leader>i", open_images_in_dir)
vim.keymap.set("n", "<leader>I", open_images_in_dir)

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        local dir = vim.fn.expand("<afile>:p:h")
        if vim.fn.isdirectory(dir) == 0 then
            vim.fn.mkdir(dir, "p")
        end
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        local cursor_pos = vim.api.nvim_win_get_cursor(0)
        local view = vim.fn.winsaveview()

        vim.cmd("silent! normal! m`")
        vim.cmd("silent! normal! gg=G")
        vim.cmd("silent! normal! ``")

        vim.api.nvim_win_set_cursor(0, cursor_pos)
        vim.fn.winrestview(view)
    end,
})
