vim.opt.shell = "bash"
vim.opt.shellcmdflag = "-c"

vim.loader.enable();
require("config.keymaps")
require("config.lazy")
require("config.lsps")
--vim.cmd([[colorscheme sorbet]])
vim.cmd([[colorscheme tokyonight-moon]])


vim.api.nvim_create_user_command("RestartLSP",
    function()
        for _, v in vim.lsp.get_clients() do
            local client = vim.lsp.get_client_by_id(v)
            if client then client:stop() end
        end
    end
, {})
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function(args)
    local buf = args.buf

    if vim.bo[buf].buftype ~= "" then
      return
    end

    local fname = vim.api.nvim_buf_get_name(buf)
    if fname == "" then
      return
    end

    local filetype = vim.bo[buf].filetype
    if filetype == "" then
      return
    end

    local running = {}
    for _, client in ipairs(vim.lsp.get_clients({ bufnr = buf })) do
      running[client.name] = true
    end

    for name in pairs(vim.lsp._enabled_configs or {}) do
      if not running[name] then
        local config = vim.lsp.config[name]
        if config and vim.tbl_contains(config.filetypes or {}, filetype) then
          local root_dir = type(config.root_dir) == "function"
            and config.root_dir(buf)
            or config.root_dir
          vim.lsp.start(
            vim.tbl_extend("force", config, { name = name, root_dir = root_dir }),
            { bufnr = buf }
          )
        end
      end
    end
  end,
})

--[[
local function create_custom_hover()
    local bufnr = vim.api.nvim_create_buf(false, true)
    
    local word = vim.fn.expand("<cword>");
    local number = tonumber(word);
    local text = {string(number)};

    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, text)
    
    -- 3. Configure the floating window's geometry and behavior
    local win_config = {
        relative = "cursor",  -- Positions the window relative to the cursor
        row = 1,              -- Places it 1 row below the cursor
        col = 0,              -- Aligns it exactly with the cursor's column
        width = 40,           -- Sets width of the window
        height = #text,       -- Dynamically sizes height based on text lines
        style = "minimal",    -- Strips out standard window numbers and statuslines
        border = "rounded",   -- Applies a smooth visual border
    }
    
    -- 4. Open the window
    local winnr = vim.api.nvim_open_win(bufnr, false, win_config)
    
    -- 5. Automatically close the window when the cursor moves
    vim.api.nvim_create_autocmd("CursorMoved", {
        buffer = vim.api.nvim_get_current_buf(),
        callback = function()
        if vim.api.nvim_win_is_valid(winnr) then
            vim.api.nvim_win_close(winnr, true)
        end
        end,
        once = true, -- Auto-deletes this listener after firing once
    })
end

-- Bind the custom hover window to a shortcut (e.g., <leader>h)
vim.keymap.set('n', 'v:n', create_custom_hover, { desc = "Trigger Custom Hover Window" })
]]
