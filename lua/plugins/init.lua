return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier"
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",
        "vimdoc",

        -- HTML, CSS, TailwindCSS
        "html",
        "css",

        --  PHP
        "php",

        -- JavaScript/Typescript
        "json",
        "javascript",
        "typescript",
        "tsx",

        --  Go
        "go",

        --  C/C++
        "c",
        "cpp"
      },
    },
  },

  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "php",
      "javascriptreact",
      "typescriptreact",
      "astro",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}
