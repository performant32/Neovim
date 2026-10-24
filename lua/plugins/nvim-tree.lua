return {
	"nvim-tree/nvim-tree.lua",
    config=function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        vim.opt.termguicolors = true
        require("nvim-tree").setup({
            filters = {
                dotfiles = false,
                exclude = {"compile_commands.json"}
            },
            git = {
                ignore=false,
            },
            sync_root_with_cwd=true,
            -- Update the root when you switch to a file outside the current root
            update_focused_file = {
                enable = true,
                update_root = true,
            },
            
            -- Respect the buffer's CWD
            respect_buf_cwd = true,
        })

        vim.keymap.set('n', '<M-n>', ':NvimTreeFindFileToggle<CR>')
    end
}
