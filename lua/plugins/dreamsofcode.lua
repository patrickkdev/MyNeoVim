local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      lazy = false,
      ensure_installed = {
        "gopls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "configs.lspconfig"
      require "configs.lspconfig"
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    lazy = false,
    ft = "go",
    opts = function ()
      return require "configs.null-ls"
    end
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function (_, opts)
      require("dap-go").setup(opts)
    end
  },
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    init = function()
      vim.g.toggle_cmp = true

      vim.keymap.set("n", "<leader>oa", function()
      vim.g.toggle_cmp = not vim.g.toggle_cmp
      if vim.g.toggle_cmp then
        vim.notify("Toggled On", vim.log.levels.INFO, { title = "Autocomplete" })
      else
          vim.notify("Toggled Off", vim.log.levels.INFO, { title = "Autocomplete" })
        end
      end, { desc = "Options | Toggle Autocomplete" })
    end,
    config = function(_, opts)
      table.insert(opts.sources, 2, { name = "codeium" })

      local icons = require "nvchad.icons.lspkind"

      opts.formatting = {
        format = function(entry, vim_item)
          local kind = require("lspkind").cmp_format { mode = "text", maxwidth = 50 }(entry, vim_item)
          local strings = vim.split(kind.kind, " ", { trimempty = true })
          kind.kind = string.format(" %s  %s", icons[vim_item.kind], strings[1])
          kind.menu = " " .. (strings[2] or "") .. ""

          return kind
        end,
      }

      local cmdline_mappings = vim.tbl_extend("force", {}, require("cmp").mapping.preset.cmdline(), {
        ["<CR>"] = { c = require("cmp").mapping.confirm { select = true } },
      })

      require("cmp").setup(opts)
      require("cmp").setup.cmdline(":", {
      mapping = cmdline_mappings,
        sources = {
          { name = "cmdline" },
        },
      })
    end,
    dependencies = {
      -- Icons
      {
       "onsails/lspkind.nvim",
      },
      -- Commandline completions
      {
        "hrsh7th/cmp-cmdline",
      },
    },
  },
  {
    "Exafunction/codeium.nvim",
    lazy = false,
    opts = {
      enable_chat = true,
    },
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    lazy = false,
    config = function (_, opts)
      require("gopher").setup(opts)
    end,
    build = function ()
      vim.cmd [[silent! GoInstallDeps]]
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "mfussenegger/nvim-dap", -- (optional) only if you use `gopher.dap`
    },
  },
}

return plugins
