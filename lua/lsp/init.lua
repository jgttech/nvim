local map = vim.keymap.set

-- I wanted to abstract out the LSP configuration and setup
-- from the plugin itself because this could get very complex
-- over time as things are added, removed, and updated.
local function config()
  local lspconfig = require("lspconfig")
  local split = require("utils.split")
  local utils = require("lsp.utils")
  local configure = utils.create_lsp_config(function(options)
    -- These will be buffer-local keybindings because they
    -- only work if you have an active language server
    map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", options("Display LSP intellisense under cursor"))
    map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", options("LSP definition"))
    map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", options("LSP declaration"))
    map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", options("LSP implementation"))
    map("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", options("LSP type definition"))
    map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", options("LSP references"))
    map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", options("LSP signature help"))
    map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", options("LSP rename"))
    map({ "n", "x" }, "<leader>fb", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", options("LSP format buffer"))
    map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", options("LSP code action(s)"))
    map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", options("Show buffer diagnostics"))
    map("n", "<leader>d", vim.diagnostic.open_float, options("Show line diagnostics"))
  end)

  require("venom").setup()

  -- LSP services configuration
  for _, service in pairs(utils.get_lsp_modules("services")) do
    require(service).setup()
  end

  -- LSP language configuration
  for _, server in pairs(utils.get_lsp_modules("servers")) do
    local import = split(server, ".")
    local lsp_name = import[#import]
    local lsp = lspconfig[lsp_name]

    if lsp then
      require(server).setup(lsp, configure)
    end
  end
end

return config
