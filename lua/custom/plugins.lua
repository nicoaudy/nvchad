return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "custom.overrides.conform",
  },

  {
    "NvChad/nvterm",
    config = function()
      require("nvterm").setup()
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = { side = "right" },
    },
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "custom.configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev stuff
        "css-lsp",
        "emmet-ls",
        "eslint-lsp",
        "html-lsp",
        "prettierd",
        "tailwindcss-language-server",
        "typescript-language-server",

        "intelephense",
        "php-cs-fixer",

        -- python
        "black",
        "pyright",
        "ruff",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "css",
        "html",
        "javascript",
        "lua",
        "markdown",
        "markdown_inline",
        "php",
        "python",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
      },
    },
  },

  {
    "hrsh7th/cmp-cmdline",
    config = function()
      require "custom.configs.cmdline"
    end,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "Exafunction/codeium.vim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.g.codeium_no_map_tab = 1 --disable the <Tab> binding
      vim.keymap.set("i", "<C-g>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true })
      vim.keymap.set("i", "<C-;>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true })
      vim.keymap.set("i", "<C-,>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true })
      vim.keymap.set("i", "<C-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true })
    end,
  },

  -- Multicursor <C-n>
  {
    "mg979/vim-visual-multi",
    lazy = false,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function()
      vim.keymap.set("n", "<leader>nd", "<cmd>Noice dismiss<cr>", { desc = "Dismiss Noice Message" })
    end,
    opts = {
      routes = {
        {
          filter = { event = "notify", find = "No information available" },
          opts = { skip = true },
        },
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },

  -- rayso
  {
    "TobinPalmer/rayso.nvim",
    cmd = { "Rayso" },
    config = function()
      require("rayso").setup {}
    end,
  },

  -- dressing | neovim popup
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    config = function()
      require "custom.configs.dressing"
    end,
  },

  -- auto close tag
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "javascript",
      "javascriptreact",
      "svelte",
      "typescript",
      "typescriptreact",
      "jsx",
      "markdown",
      "php",
      "tsx",
    },
    config = function()
      require "custom.configs.ts-autotag"
    end,
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    init = function()
      vim.g.tmux_navigator_no_mappings = 1
    end,
  },
}
