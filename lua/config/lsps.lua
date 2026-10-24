vim.lsp.config("clangd", {
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },

   root_dir = function(bufnr)
        local fname = vim.api.nvim_buf_get_name(bufnr)
        return vim.fs.root(fname, { ".git", "compile_commands.json" })
    end,
});
vim.lsp.config("python-lsp-server",{
    cmd={"pylsp"},
    filetypes={"python"},
    root_dir = function(bufnr)
        local fname = vim.api.nvim_buf_get_name(bufnr)
        return vim.fs.root(fname, { ".git", "src/", "tests/", "main.py"})
    end,
})
vim.lsp.config("omnisharp",{
    cmd={"omnisharp"},
    filetypes={"cs"},
    root_dir = function(bufnr)
        local fname = vim.api.nvim_buf_get_name(bufnr)
        return vim.fs.root(fname, { ".git", ".csproj",".slnx", "*.sln","src/", "tests/"})
    end,
})
vim.lsp.config("lua-language-server",{
    cmd={"lua-language-server"},
    filetypes={"lua"},
    --[[
    root_dir = function(bufnr)
        local fname = vim.api.nvim_buf_get_name(bufnr)
        return vim.fs.root(fname, { ".git", ".csproj",".slnx", "*.sln","src/", "tests/", ".rbxl"})
    end,]]
    settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        -- Tell the language server that 'vim' is an expected global variable
        globals = { "vim" }, 
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
    },
  },
})
vim.lsp.config("luau-lsp",{
    cmd={
        "luau-lsp", "lsp",
        "--definitions=" .. vim.fn.expand("~/.local/share/nvim/luau-lsp/globalTypes.d.luau"),
        "--docs=" .. vim.fn.expand("~/.local/share/nvim/luau-lsp/api-docs.json"),
    },
    filetypes={"luau"},
    root_dir = function(bufnr)
        local fname = vim.api.nvim_buf_get_name(bufnr)
        return vim.fs.root(fname, { ".git"})
    end,

})
vim.lsp.config("cmake-language-server",{
    cmd={"cmake-language-server"},
    filetypes={"cmake", "txt"},
    root_dir = function(bufnr)
        local fname = vim.api.nvim_buf_get_name(bufnr)
        return vim.fs.root(fname, { ".git", "CMakeLists.txt"})
    end,
    init_options={

    }
})
vim.lsp.config("jdtls",{
    cmd={"jdtls"},
    filetypes={"java"},
    root_dir = function(bufnr)
        local fname = vim.api.nvim_buf_get_name(bufnr)
        return vim.fs.root(fname, { ".git", "gradlew", "settings.gradle"})
    end,
})
vim.lsp.config("gopls",{
    cmd={"gopls"},
    filetypes={"go"},
    root_dir = function(bufnr)
        local fname = vim.api.nvim_buf_get_name(bufnr)
        return vim.fs.root(fname, { ".git", "go.sum", ".env"})
    end,
})
vim.lsp.config("ts_ls",{
    cmd={"typescript-language-server", "--stdio"},
    filetypes={"typescript", "javascript", 'typescriptreact'},
    root_dir = function(bufnr)
        local fname = vim.api.nvim_buf_get_name(bufnr)
        return vim.fs.root(fname, { ".git", "package.json", ".package-lock.json"})
    end,
})
vim.lsp.enable("clangd")
vim.lsp.enable("python-lsp-server")
vim.lsp.enable("omnisharp")
vim.lsp.enable("ts_ls")
vim.lsp.enable("lua-language-server")
vim.lsp.enable("luau-lsp")
vim.lsp.enable("cmake-language-server")
vim.lsp.enable("jdtls")
vim.lsp.enable("gopls")
