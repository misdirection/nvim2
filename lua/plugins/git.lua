return {
  {
    "sindrets/diffview.nvim", -- optional - Diff integration
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    event = "BufRead",
    keys = {
      { "<leader>jj", "<cmd>set hidden<cr><cmd>DiffviewClose<cr><cmd>set nohidden<cr>" },
    },
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional
    },
    event = "BufRead",
    config = function()
      require("neogit").setup({
        commit_popup = {
          kind = "split",
        },
        integrations = {
          diffview = true,
        },
      })
      vim.keymap.set("n", "<leader>do", function()
        require("telescope.builtin").git_branches({
          attach_mappings = function(_, map)
            map("i", "<CR>", function(prompt_bufnr)
              local actions = require("telescope.actions")
              local state = require("telescope.actions.state")
              local selection = state.get_selected_entry(prompt_bufnr)
              actions.close(prompt_bufnr)

              -- Überprüfen, ob ein Branch ausgewählt wurde
              if selection and selection.value then
                -- Diffview öffnen mit dem Branch-Kontext
                vim.cmd("DiffviewOpen " .. selection.value)
              else
                print("Abgebrochen: Kein Branch ausgewählt.")
              end
            end)
            return true
          end,
        })
      end, { noremap = true, silent = true, desc = "Diffview: Open diff for current file and branch" })
    end,
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit", noremap = true, silent = true },
    },
  },
}
