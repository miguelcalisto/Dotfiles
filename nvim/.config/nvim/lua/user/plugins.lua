return {
    -- Tema
    -- },
    -- "catppuccin/nvim",
    -- name = "catppuccin",
    -- priority = 1000,
    -- },
    --
    {
        "Mofiqul/dracula.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("dracula").setup({
                transparent_bg = true,
                italic_comment = true,
                lualine_bg_color = "#000000",
            })

            vim.cmd.colorscheme("dracula")
            vim.api.nvim_set_hl(0, "FzfLuaNormal", { bg = "#1e1e2e" })
            vim.api.nvim_set_hl(0, "FzfLuaBorder", { bg = "#1e1e2e" })

            vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", {
                fg = "#ff5555",
            })

            vim.api.nvim_set_hl(0, "NvimTreeFolderArrowClosed", {
                fg = "#bd93f9",
            })

            vim.api.nvim_set_hl(0, "NvimTreeFolderArrowOpen", {
                fg = "#50fa7b",
            })

            vim.api.nvim_set_hl(0, "Comment", {
                fg = "#7aa2f7",
                italic = true,
            })

            -- install panel

            vim.api.nvim_set_hl(0, "LazyNormal", { bg = "#282a36" })
            vim.api.nvim_set_hl(0, "LazyBorder", { fg = "#bd93f9", bg = "#000000" })
            vim.api.nvim_set_hl(0, "LazyButton", { bg = "#111111" })
            vim.api.nvim_set_hl(0, "LazyButtonActive", { bg = "#2a2b3c" })

            vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
            vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE", ctermbg = "NONE" })
            vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE", ctermbg = "NONE" })
            vim.api.nvim_set_hl(0, "LineNr", { fg = "#f9e2af", bg = "NONE" })
            vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#facc15", bg = "NONE", bold = true })
            vim.api.nvim_set_hl(0, "CursorLine", { bg = "#313244" })

            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
            -- vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "#000000" })
            vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "#000000" })
            vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "#000000" })
            vim.api.nvim_set_hl(0, "NvimTreeCursorLine", { bg = "#111111" })

            vim.api.nvim_set_hl(0, "NvimTreeCursorLine", { bg = "#2a2b3c" })
        end,
    },

    -- Gerenciador LSP
    { "williamboman/mason.nvim", config = true },
    { "williamboman/mason-lspconfig.nvim" },

    {
        "folke/neodev.nvim",
        config = true,
    },

    -- LSP
    {
        "neovim/nvim-lspconfig",
    },

    -- Autocomplete
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
    },

    -- Arquivos
    --
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup({
                sync_root_with_cwd = true,
                respect_buf_cwd = true,
                update_focused_file = {
                    enable = true,
                    update_cwd = true,
                },
                view = {
                    width = 30,
                    side = "left",
                },
            })
        end,
    },

    -- Barra de status
    -- { "nvim-lualine/lualine.nvim" },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup({
                options = {
                    theme = {
                        normal = {
                            a = { bg = "#ff5555", fg = "#000000", gui = "bold" },
                            b = { bg = "#44475a", fg = "#ffffff", gui = "bold" },
                            c = { bg = "#1e1e2e", fg = "#ffffff", gui = "bold" },
                        },
                        inactive = {
                            c = { bg = "#111111", fg = "#888888", gui = "bold" },
                        },
                    },
                },
            })
        end,
    },

    -- Telescope
    -- {
        --     "nvim-telescope/telescope.nvim",
        --     dependencies = { "nvim-lua/plenary.nvim" },
        -- },

        -- Which-key
        { "folke/which-key.nvim" },

        -- Comment
        { "numToStr/Comment.nvim", config = true },

        {
            "norcalli/nvim-colorizer.lua",
            config = function()
                require("colorizer").setup({
                    "*",
                }, {
                    RGB = true,
                    RRGGBB = true,
                    names = false,
                    RRGGBBAA = true,
                    rgb_fn = true,
                    hsl_fn = true,
                    css = true,
                    css_fn = true,
                })
            end,
        },

        -- Color picker OKLCH
        {
            "eero-lehtinen/oklch-color-picker.nvim",
            event = "VeryLazy",
            keys = {
                {
                    "<leader>col",
                    function()
                        require("oklch-color-picker").pick_under_cursor()
                    end,
                    desc = "Pick color under cursor",
                },
            },
            opts = {},
        },

        -- Gitsigns
        {
            "lewis6991/gitsigns.nvim",
            config = function()
                require("gitsigns").setup()
            end,
        },

        -- Bufferline
        {
            "akinsho/bufferline.nvim",
            version = "*",
            dependencies = { "nvim-tree/nvim-web-devicons" },
            config = function()
                require("bufferline").setup({
                    options = {
                        mode = "buffers",
                        separator_style = "slant",
                        diagnostics = "nvim_lsp",
                    },
                })

                vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })
                vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })
            end,
        },

        -- Marks na lateral
        {
            "kshenoy/vim-signature",
            config = function()
                vim.g.signature_on = 1
                vim.g.signature_map_keys = 1
            end,
        },

        -- Emmet (HTML/CSS/Django)
        {
            "mattn/emmet-vim",
            ft = { "html", "css", "django" },
        },
        -- Formatação automática
        {
            "stevearc/conform.nvim",
            config = function()
                require("conform").setup({
                    formatters_by_ft = {
                        lua = { "stylua" },
                        python = { "black", "isort" },
                        javascript = { { "prettierd", "prettier" } },
                        typescript = { { "prettierd", "prettier" } },
                        html = { "prettier" },
                        css = { "prettier" },
                        json = { "prettier" },
                        markdown = { "prettier" },
                        sh = { "shfmt" },
                    },
                    format_on_save = {
                        timeout_ms = 500,
                        lsp_fallback = true,
                    },
                })
            end,
        },

        {
            "windwp/nvim-autopairs",
            event = "InsertEnter",
            config = true,
        },

        {
            "lukas-reineke/indent-blankline.nvim",
            main = "ibl",
            config = function()
                require("ibl").setup({
                    scope = { enabled = true },
                })
            end,
        },

        {
            "phaazon/hop.nvim",
            branch = "v2",
            config = function()
                require("hop").setup()
                vim.keymap.set("n", "s", "<cmd>HopChar2<CR>")
                vim.keymap.set("n", "S", "<cmd>HopWord<CR>")
            end,
        },

        {
            "folke/trouble.nvim",
            dependencies = { "nvim-tree/nvim-web-devicons" },
            config = function()
                require("trouble").setup()
                vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<CR>")
            end,
        },

        {
            "nvimdev/lspsaga.nvim",
            dependencies = {
                "nvim-treesitter/nvim-treesitter",
                "nvim-tree/nvim-web-devicons",
            },
            config = function()
                require("lspsaga").setup({})
            end,
        },

        {
            "stevearc/dressing.nvim",
            event = "VeryLazy",
        },

        {
            "smjonas/inc-rename.nvim",
            config = function()
                require("inc_rename").setup()
                vim.keymap.set("n", "<leader>rn", ":IncRename ")
            end,
        },

        {
            "akinsho/toggleterm.nvim",
            version = "*",
            config = function()
                require("toggleterm").setup({
                    open_mapping = [[<c-\>]],
                    direction = "float",
                    shade_terminals = true,
                    float_opts = {
                        border = "rounded",
                        width = math.floor(vim.o.columns * 0.65), -- menor
                        height = math.floor(vim.o.lines * 0.55), -- menor
                        winblend = 0,
                    },
                })

                -- abre / fecha com espaço + tt
                vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Terminal flutuante" })

                -- vim.keymap.set("t", "<leader><leader>", [[<C-\><C-n>]], { desc = "Sair do terminal" })
                --

                vim.keymap.set("t", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Fechar terminal" })
            end,
        },

        {
            "nvim-pack/nvim-spectre",
            dependencies = { "nvim-lua/plenary.nvim" },
            config = function()
                vim.keymap.set("n", "<leader>sr", "<cmd>Spectre<CR>", { desc = "Search & Replace" })
            end,
        },

        --
        -- {
            --     "folke/noice.nvim",
            --     event = "VeryLazy",
            --     dependencies = {
                --         "MunifTanjim/nui.nvim",
                --         "rcarriga/nvim-notify",
                --     },
                --     config = function()
                    --         require("noice").setup({})
                    --     end,
                    -- },

                    --
                    -- {
                        --     "nvim-tree/nvim-tree.lua",
                        --     dependencies = { "nvim-tree/nvim-web-devicons" },
                        --     config = function()
                            --         require("nvim-tree").setup({
                                --             update_cwd = true,
                                --             respect_buf_cwd = true,
                                --             view = {
                                    --                 width = 30,
                                    --                 side = "left",
                                    --             },
                                    --         })
                                    --     end,
                                    -- },
                                    --

                                    {
                                        "echasnovski/mini.move",
                                        version = false,
                                        config = function()
                                            require("mini.move").setup({
                                                mappings = {
                                                    line_down = "<S-Down>",
                                                    line_up = "<S-Up>",

                                                    down = "<S-Down>",
                                                    up = "<S-Up>",
                                                },
                                            })
                                        end,
                                    },

                                    {
                                        "folke/snacks.nvim",
                                        opts = {
                                            dashboard = {
                                                preset = {
                                                    keys = {
                                                        {
                                                            icon = "🔍 ",
                                                            key = "f",
                                                            desc = "Find File",

                                                            action = ":lua require('fzf-lua').files()",
                                                        },
                                                        { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                                                        {
                                                            icon = " ",
                                                            key = "g",
                                                            desc = "Find Text",

                                                            action = ":lua require('fzf-lua').live_grep()",
                                                        },
                                                        {
                                                            icon = " ",
                                                            key = "r",
                                                            desc = "Recent Files",

                                                            action = ":lua require('fzf-lua').oldfiles()",
                                                        },

                                                        { icon = "📁 ", key = "e", desc = "Explorer", action = ":NvimTreeToggle<CR>" },
                                                        {
                                                            icon = "⚙️ ",
                                                            key = "c",
                                                            desc = "Config",
                                                            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
                                                        },
                                                        { icon = " ", key = "x", desc = "Lazy sync", action = ":Lazy sync" },
                                                        { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
                                                        { icon = "  ", key = "q", desc = "Quit", action = ":qa" },
                                                    },
                                                },
                                            },
                                        },
                                    },

                                    {
                                        "ThePrimeagen/harpoon",
                                        branch = "harpoon2",
                                        dependencies = { "nvim-lua/plenary.nvim" },
                                        config = function()
                                            local harpoon = require("harpoon")
                                            harpoon:setup()

                                            vim.keymap.set("n", "<leader>ha", function()
                                                harpoon:list():add()
                                            end, { desc = "Harpoon Add file" })

                                            vim.keymap.set("n", "<leader>hh", function()
                                                harpoon.ui:toggle_quick_menu(harpoon:list())
                                            end, { desc = "Harpoon Menu" })

                                            vim.keymap.set("n", "<leader>hj", function()
                                                harpoon:list():next()
                                            end, { desc = "Harpoon Next" })

                                            vim.keymap.set("n", "<leader>hk", function()
                                                harpoon:list():prev()
                                            end, { desc = "Harpoon Prev" })

                                            vim.keymap.set("n", "<leader>h1", function()
                                                harpoon:list():select(1)
                                            end)

                                            vim.keymap.set("n", "<leader>h2", function()
                                                harpoon:list():select(2)
                                            end)

                                            vim.keymap.set("n", "<leader>h3", function()
                                                harpoon:list():select(3)
                                            end)

                                            vim.keymap.set("n", "<leader>h4", function()
                                                harpoon:list():select(4)
                                            end)

                                            vim.keymap.set("n", "<leader>hd", function()
                                                harpoon:list():remove()
                                            end, { desc = "Harpoon Remove file" })
                                        end,
                                    },

                                    {
                                        "ibhagwan/fzf-lua",
                                        dependencies = {
                                            "nvim-tree/nvim-web-devicons",
                                            "roginfarrer/fzf-lua-lazy.nvim",
                                        },
                                        config = function()
                                            require("fzf-lua").setup({
                                                winopts = {
                                                    height = 0.85,
                                                    width = 0.80,
                                                    prompt_pos = "bottom",
                                                    preview = {
                                                        layout = "horizontal",
                                                    },
                                                },

                                                fzf_opts = {
                                                    ["--layout"] = "reverse-list",

                                                    ["--color"] = "pointer:#50fa7b,marker:#50fa7b,bg+:#44475a,fg+:#ffffff,hl:#ffb86c,hl+:#ffb86c",
                                                },
                                            })

                                            vim.keymap.set("n", "<leader>ff", function()
                                                require("fzf-lua").files()
                                            end, { desc = "Find Files" })

                                            vim.keymap.set("n", "<leader>fg", function()
                                                require("fzf-lua").live_grep()
                                            end, { desc = "Live Grep" })

                                            vim.keymap.set("n", "<leader>fr", function()
                                                require("fzf-lua").oldfiles()
                                            end, { desc = "Recent Files" })

                                            vim.keymap.set("n", "<leader>fp", function()
                                                require("fzf-lua-lazy").search()
                                            end, { desc = "Lazy Plugins (fzf)" })
                                        end,
                                    },
                                }
