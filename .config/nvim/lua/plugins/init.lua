return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {},
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "rust", 
        "toml"
      },
    },
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^9",
    lazy = false,
  },

  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("crates").setup()
    end,
  },
}
