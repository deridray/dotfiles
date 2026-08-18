-- ~/.config/nvim/lua/plugins/bufferline.lua
return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    keys = {
      { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "previous tab" },
      { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "next tab" },
      { "<leader>bd", "<cmd>bdelete<cr>", desc = "delete tab" },
    },
    opts = {
      options = {
        mode = "buffers",
        separator_style = "slant", -- або "thin", "slope"
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
  },
}