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
            require("telescope").setup({
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
                    find_files = {
                        hidden = true, -- inclui arquivos ocultos no find_files
                    },
                },
            })

            -- <leader>ff - busca arquivos, incluindo ocultos
            vim.keymap.set("n", "<leader>ff", function()
                require("telescope.builtin").find_files({ hidden = true })
            end, { desc = "Find Files (ocultos incluídos)" })

            -- <leader>fg - live_grep incluindo as pastas ignoradas no vimgrep_arguments
            vim.keymap.set("n", "<leader>fg", function()
                require("telescope.builtin").live_grep()
            end, { desc = "Live Grep (ignorando .git, .Library, node_modules)" })
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
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
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
}

