return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      { "fredrikaverpil/neotest-golang", version = "*" }, -- Installation
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-golang"), -- Registration
        },
      })
    end,
  },
}
