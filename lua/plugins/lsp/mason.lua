return {
  load = function(opts, lspconfig, capabilities)
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    require("mason-lspconfig").setup({
      ensure_installed = opts.mason.lspconfig,
      automatic_installation = true,
      handlers = {
        function(server)
          lspconfig[server].setup({
            capabilities = capabilities,
          })
        end,
      },
    })

    require("mason-tool-installer").setup({
      ensure_installed = opts.mason.lspconfig,
      auto_update = true,
      run_on_start = true,
    })

    require("mason-null-ls").setup({
      ensure_installed = opts.mason.nonels,
    })
  end,
}
