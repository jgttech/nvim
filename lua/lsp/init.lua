local map = vim.keymap.set

-- I wanted to abstract out the LSP configuration and setup
-- from the plugin itself because this could get very complex
-- over time as things are added, removed, and updated.
local function lsp(_, opts)
  local lspconfig = require("lspconfig")
  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  local setup = require("lsp.setup")
  local mason_setup = setup.mason or {}
  local args = {
    opts = opts,
    lspconfig = lspconfig,
    capabilities = capabilities,
  }

  for k, v in pairs(mason_setup) do
    print('>>> MASON SETUP:', k, v)
  end

  require("venom").setup()

  -- LSP scripts loading
  -- for _, script in pairs(opts.scripts) do
  --   print("lsp.servers." .. script)
  --   require("lsp.servers." .. script).setup(args)
  -- end

  -- Separate LSP integration setup
  -- require("lsp.config.mason").setup(args)
  -- require("lsp.config.cmp").setup()
  -- require("lsp.config.none-ls").setup()
  -- require("lsp.config.gitsigns").setup()

  -- Use LspAttach autocommand to only map the following keys
  -- after the language server attaches to the current buffer
  -- vim.api.nvim_create_autocmd("LspAttach", {
  --   desc = "LSP actions",
  --   callback = function(event)
  --     local options = function(desc)
  --       return {
  --         noremap = true,
  --         silent = true,
  --         buffer = event.buf,
  --         desc = desc,
  --       }
  --     end
  --
  --     -- These will be buffer-local keybindings because they
  --     -- only work if you have an active language server
  --     map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", options("Display LSP intellisense under cursor"))
  --     map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", options("LSP definition"))
  --     map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", options("LSP declaration"))
  --     map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", options("LSP implementation"))
  --     map("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", options("LSP type definition"))
  --     map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", options("LSP references"))
  --     map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", options("LSP signature help"))
  --     map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", options("LSP rename"))
  --     map({ "n", "x" }, "<leader>fb", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", options("LSP format buffer"))
  --     map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", options("LSP code action(s)"))
  --   end,
  -- })
end

return lsp
