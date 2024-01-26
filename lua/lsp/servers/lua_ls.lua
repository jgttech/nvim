return {
  setup = function(args)
    local lspconfig = args.lspconfig

    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              vim.env.VIMRUNTIME,
            },
          },
        },
      },
    })
  end,
}
