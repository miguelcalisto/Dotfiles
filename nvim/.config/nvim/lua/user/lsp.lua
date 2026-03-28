require("mason").setup()
require("mason-lspconfig").setup({ ensure_installed = { "lua_ls", "pyright", "bashls" } })

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local function setup_server(name, cmd, filetypes)
    vim.lsp.start({
        name = name,
        cmd = cmd,
        root_dir = vim.loop.cwd,
        filetypes = filetypes,
        capabilities = capabilities,
    })
end

setup_server("lua_ls", { "lua-language-server" }, { "lua" })
setup_server("pyright", { "pyright-langserver", "--stdio" }, { "python" })
setup_server("bashls", { "bash-language-server", "start" }, { "sh", "bash" })
