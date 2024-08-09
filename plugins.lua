local plugins = {
  {
    "williamboman/mason.vim",
    opts = {
      ensure_installed = {
        "gopls",
      },
    },
  },
}

return plugins
