return {
  "e-sigs/winbuf.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  keys = {
    { "<S-h>", function() require("winbuf").cycle(-1) end, desc = "Prev buffer" },
    { "<S-l>", function() require("winbuf").cycle(1) end, desc = "Next buffer" },

    { "<S-A-h>", function() require("winbuf").move_buf("h") end, desc = "Move buffer left" },
    { "<S-A-l>", function() require("winbuf").move_buf("l") end, desc = "Move buffer right" },
    { "<S-A-j>", function() require("winbuf").move_buf("j") end, desc = "Move buffer down" },
    { "<S-A-k>", function() require("winbuf").move_buf("k") end, desc = "Move buffer up" },

    { "<A-w>", function() require("winbuf").close_buf() end, desc = "Close buffer (window)" },
    { "<A-S-w>", function() require("winbuf").close_split() end, desc = "Close split" },
  },
}
