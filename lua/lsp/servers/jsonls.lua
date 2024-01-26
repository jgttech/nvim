return {
  setup = function(args)
    local lspconfig = args.lspconfig
    local schemastore = require("schemastore")

    lspconfig.jsonls.setup({
      settings = {
        json = {
          schemas = schemastore.json.schemas(),
          validate = {
            enable = true,
          },
        },
      },
    })
  end,
}
