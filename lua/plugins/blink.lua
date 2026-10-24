return {
    'saghen/blink.cmp',
    version="1.10.2",
    dependencies = {
        'saghen/blink.lib',
        -- optional: provides snippets for the snippet source
        'rafamadriz/friendly-snippets',
        {
            'saghen/blink.compat',
            -- use v2.* for blink.cmp v1.*
            version = '2.*',
            -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
            lazy = true,
            -- make sure to set opts so that lazy.nvim calls blink.compat's setup
            opts = {},
        },
        {
        "zbirenbaum/copilot.lua",
            cmd = "Copilot",
            event = "InsertEnter",
            config = function()
                require("copilot").setup({should_config=true})
            end,
        }
    },
    build = function()
        -- build the fuzzy matcher, wait up to 60 seconds
        -- you can use `gb` in `:Lazy` to rebuild the plugin as needed
        require('blink.cmp').build():wait(60000)
    end,

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
        -- 'super-tab' for mappings similar to vscode (tab to accept)
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = { preset = 'default' },

        appearance = {
            --use_nvim_cmp_as_default=true
            -- (Default) Show ghost text of the currently selected item
            --ghost_text = true,
             -- (Default) Show a documentation popup when navigating items
            --documentation = true,
        },
        -- (Default) Only show the documentation popup when manually triggered
        completion = { documentation = { auto_show = false } },

        -- (Default) list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer', "copilot"},
            providers={
                copilot={
                    name="copilot",
                    module="blink.compat.source"
                }
            }
        },

        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"`
        -- See the fuzzy documentation for more information
        fuzzy = { implementation = "rust" }
    },
}
