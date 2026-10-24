return {
    "krady21/compiler-explorer.nvim",
    ft = {"c", "cpp", "rust", "go", "zig"},
    dependencies = {
        -- Required for nicer interactive compiler and dropdown selectors
        "stevearc/dressing.nvim",
    },
    config=function()
        require("compiler-explorer").setup{
            url = "https://godbolt.org",
            infer_lang = true, -- Try to infer possible language based on file extension.
            line_match = {
                highlight = false, -- highlight the matching line(s) in the other buffer.
                jump = false, -- move the cursor in the other buffer to the first matching line.
            },
            open_qflist = false, --  Open qflist after compilation if there are diagnostics.
            split = "split", -- How to split the window after the second compile (split/vsplit).
            compiler_flags = "", -- Default flags passed to the compiler.
            job_timeout_ms = 25000, -- Timeout for libuv job in milliseconds.
            languages = { -- Language specific default compiler/flags
                --c = {
                --  compiler = "g121",
                --  compiler_flags = "-O2 -Wall",
                --},
            },
        }
        local map = vim.keymap.set
        -- Compile the current buffer and open the assembly view
        map("n", "<leader>ce", "<cmd>CompilerExplorer<cr>", { desc = "Compiler Explorer (Compile)" })
        -- Interactively select a different compiler or language
        map("n", "<leader>cc", "<cmd>CompilerExplorerOpenCompilerClose<cr>", { desc = "CE Change Compiler" })
        -- Visual mode map to compile only a highlighted selection
        map("v", "<leader>ce", ":CompilerExplorer<cr>", { desc = "CE Compile Selection" })
end
}
