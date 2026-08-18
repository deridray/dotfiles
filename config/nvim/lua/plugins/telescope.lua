return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "знайти файл" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "знайти текст" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>",    desc = "відкриті буфери" },
    },
  },
}