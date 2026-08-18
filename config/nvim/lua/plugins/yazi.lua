-- ~/.config/nvim/lua/plugins/yazi.lua
return {
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>-",
        function()
          require("yazi").yazi()
        end,
        desc = "відкрити yazi в поточному файлі",
      },
      {
        "<leader>cw",
        function()
          require("yazi").yazi(nil, vim.fn.getcwd())
        end,
        desc = "відкрити yazi в корені проєкту",
      },
    },
    opts = {
      open_for_directories = false,
    },
  },
}