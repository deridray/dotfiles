-- ~/.config/nvim/lua/plugins/session.lua
return {
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {},
    keys = {
      { "<leader>qs", function() require("persistence").load() end, desc = "restore project session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "restore last session" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "don't save current session" },
    },
  },
}