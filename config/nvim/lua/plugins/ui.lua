-- ~/.config/nvim/lua/plugins/ui.lua
return {
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "folke/which-key.nvim", event = "VeryLazy", opts = {} },
  { "lewis6991/gitsigns.nvim", opts = {} },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- відстеження часу останнього збереження
      local augroup = vim.api.nvim_create_augroup("LualineDate", { clear = true })

      vim.api.nvim_create_autocmd({ "BufReadPost", "BufEnter" }, {
        group = augroup,
        callback = function()
          if vim.b.last_saved then return end
          local stat = vim.uv.fs_stat(vim.api.nvim_buf_get_name(0))
          if stat then vim.b.last_saved = os.date("%H:%M:%S", stat.mtime.sec) end
        end,
      })

      vim.api.nvim_create_autocmd("BufWritePost", {
        group = augroup,
        callback = function()
          vim.b.last_saved = os.date("%H:%M:%S")
        end,
      })

      -- перевірка наявності noice, щоб не падало при завантаженні
      local has_noice, noice = pcall(require, "noice")

      require("lualine").setup({
        options = {
          theme = "auto",
          globalstatus = true,
          component_separators = "|",
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = {
            "filename",
            {
              function() return has_noice and noice.api.status.mode.get() or "" end,
              cond = function() return has_noice and noice.api.status.mode.has() end,
              color = { fg = vim.g.base16_gui09 },
            },
          },
          lualine_x = {
            {
              function() return "󰆓 " .. (vim.b.last_saved or "New") end,
              cond = function() return vim.api.nvim_buf_get_name(0) ~= "" end,
              color = { fg = vim.g.base16_gui0B, gui = "bold" },
            },
            "fileformat",
            "filetype",
          },
          lualine_y = {
            { function() return " " .. os.date("%H:%M") end },
            "progress",
          },
          lualine_z = {
            {
              function()
                return string.format("%d:%d/%d", vim.fn.line("."), vim.fn.col("."), vim.api.nvim_buf_line_count(0))
              end,
              padding = { left = 1, right = 1 },
            },
          },
        },
      })
    end,
  },
}