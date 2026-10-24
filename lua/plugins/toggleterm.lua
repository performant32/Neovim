return {
    {'akinsho/toggleterm.nvim', version = "*", config=true, opts = {
        open_mapping=[[<c-\>]],
        start_in_insert=true,
        direction="horizontal",
        winbar={
            enabled=false,
            name_formatter=function(term)
                return term.name
            end
        },
        close_on_exit=true,
        persist_mode=true,
            terminal_mappings=true,
        
    }}
}
