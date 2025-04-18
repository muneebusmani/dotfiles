if lazyvim_docs then
  -- LSP Server to use for PHP.
  -- Set to "intelephense" to use intelephense instead of phpactor.
  vim.g.lazyvim_php_lsp = "intelephense"
end

local lsp = vim.g.lazyvim_php_lsp or "phpactor"
-- lsp = "intelephense"

return {
  recommended = {
    ft = "php",
    root = { "composer.json", ".phpactor.json", ".phpactor.yml" },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "php", "phpdoc", "php_only", "blade" } },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        phpactor = {
          enabled = lsp == "phpactor",
        },
        intelephense = {
          enabled = lsp == "intelephense",
          init_options = {
            licenceKey = "EducationalCode",
          },
        },
        [lsp] = {
          enabled = true,
        },
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "duster",
      },
    },
  },

  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      local dap = require("dap")
      local path = require("mason-registry").get_package("php-debug-adapter"):get_install_path()
      dap.adapters.php = {
        type = "executable",
        command = "node",
        args = { path .. "/extension/out/phpDebug.js" },
      }
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = opts.sources or {}
      table.insert(opts.sources, nls.builtins.formatting.pint)
      -- table.insert(opts.sources, nls.builtins.diagnostics.phpstan)
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        php = { "duster" },
      },
    },
  },
  {
    "adalessa/laravel.nvim",
    dependencies = {
      "tpope/vim-dotenv",
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
      "kevinhwang91/promise-async",
    },
    cmd = { "Laravel" },
    keys = {
      { "<leader>la", ":Laravel artisan<cr>" },
      { "<leader>lr", ":Laravel routes<cr>" },
      { "<leader>lm", ":Laravel related<cr>" },
    },
    event = { "VeryLazy" },
    opts = {},
    config = true,
  },
}
