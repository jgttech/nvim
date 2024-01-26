return {
  setup = function(args)
    local lspconfig = args.lspconfig
    local schemastore = require("schemastore")

    lspconfig.yamlls.setup({
      settings = {
        yaml = {
          schemas = schemastore.yaml.schemas(),
          schemaStore = {
            enable = false,
            url = "",
          },
        },
      },
    })
  end,
}
