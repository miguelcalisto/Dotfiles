return {
    -- Tema
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },

    -- Color highlight
    {
        "norcalli/nvim-colorizer.lua",
    },

    -- Lazy (gerenciador de plugins)
    {
        "folke/lazy.nvim",
    },

    -- Arquivos
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    -- Barra de status
    {
        "nvim-lualine/lualine.nvim",
    },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local telescope = require("telescope")
            local builtin = require("telescope.builtin")

            telescope.setup({
                defaults = {
                    vimgrep_arguments = {
                        'rg',
                        '--color=never',
                        '--no-heading',
                        '--with-filename',
                        '--line-number',
                        '--column',
                        '--smart-case',
                        '--glob', '!.git/*',
                        '--glob', '!.Library/*',
                        '--glob', '!node_modules/*',
                    },
                },
                pickers = {
                    find_files = { hidden = true },
                },
            })

            -- Atalhos
            vim.keymap.set("n", "<leader>ff", function() builtin.find_files({ hidden = true }) end, { desc = "Find Files (ocultos)" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
            vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Arquivos Recentes" })
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers Abertos" })
        end,
    },

    -- Which Key
    {
        "folke/which-key.nvim",
    },

    -- LSP
    {
        "neovim/nvim-lspconfig",
    },

    -- Autocomplete
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args) luasnip.lsp_expand(args.body) end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                }),
            })
        end,
    },

    -- Gitsigns para mostrar alterações no gutter
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end
    },

    -- Bufferline (abas estilo VS Code)
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("bufferline").setup {
                options = {
                    mode = "buffers",
                    separator_style = "slant",
                    diagnostics = "nvim_lsp",
                },
            }

            -- Navegar entre abas
            vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })
            vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })
        end,
    },

    -- Plugin para gerenciar marks
    {
        "kshenoy/vim-signature",
        config = function()
            vim.cmd("let g:signature_on = 1")         -- Ativa a visualização das marks na lateral
            vim.cmd("let g:signature_map_keys = 0")  -- Desativa os keymaps padrão
        end
    },
    -- Emmet para acelerar HTML/CSS (útil em Django templates)
    {
        "mattn/emmet-vim",
        ft = { "html", "css", "django" },
    },
    {
        "NvChad/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end
    },
    {
        "eero-lehtinen/oklch-color-picker.nvim",
        event = "VeryLazy",
        version = "*",
        keys = {
            -- One handed keymap recommended, you will be using the mouse
            {
                "<leader>v",
                function() require("oklch-color-picker").pick_under_cursor() end,
                desc = "Color pick under cursor",
            },
        },
        ---@type oklch.Opts
        opts = {},
    },
    { "nvzone/volt", lazy = true },

    {
        "numToStr/Comment.nvim",
        lazy = false,
        config = function()
            require("Comment").setup()
        end,
    },
}


