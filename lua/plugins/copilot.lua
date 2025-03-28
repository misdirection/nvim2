return {
  {
    "github/copilot.vim",
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
      "nvim-telescope/telescope.nvim", -- Optional: For using slash commands
      { "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } }, -- Optional: For prettier markdown rendering
      { "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves `vim.ui.select`
    },
    config = function()
      require("codecompanion").setup({
        opts = {
          language = "German", -- Default is "English"
        },
        display = {
          diff = {
            provider = "mini_diff",
          },
          chat = {
            render_headers = false,
          },
        },
      })
    end,
    keys = {
      { "<leader>cc", "<cmd>CodeCompanionChat<cr>", desc = "CodeCompanion Chat", noremap = true, silent = true },
    },
  },
}
