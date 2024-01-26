return {
  setup = function(yamlls, configure)
    local schemastore = require("schemastore")

    yamlls.setup(configure({
      settings = {
        yaml = {
          schemas = schemastore.yaml.schemas(),
          schemaStore = {
            enable = false,
            url = "",
          },
        },
      },
    }))
  end,
}
