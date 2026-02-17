return {
  {
    "NeogitOrg/neogit",
    enabled = true,
    dependencies = {
      "nvim-lua/plenary.nvim",  -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed.
      --		"nvim-telescope/telescope.nvim", -- optional
      --		"ibhagwan/fzf-lua",            -- optional
      --		"echasnovski/mini.pick",       -- optional
    },
    config = function()
      require("neogit").setup({
        kind = "split",
        process_spinner = true,
        integrations = {
          diffview = true,
          fzf_lua = true,
        }
      })
    end,
    keys = {
      { "<leader>gs", "<cmd>Neogit<cr>", desc = "Open Neogit status buffer" },
    },
  },
}
