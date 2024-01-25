local map = vim.keymap.set

return {
  "neovim/nvim-lspconfig",
  -- event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "jay-babu/mason-null-ls.nvim",
    "L3MON4D3/LuaSnip",
    "nvimtools/none-ls.nvim",
    "nvim-lua/plenary.nvim",
    "rafi/neoconf-venom.nvim",
    "b0o/schemastore.nvim",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
  },
  opts = {
    -- I decided to place the LSP scripts here so that I can
    -- manage them outside the logic of the configuration itself.
    -- This should automatically apply the scripts in the "lsp"
    -- directory for configuring each piece of the LSP, per-language.
    scripts = {
      "mason",
      "none-ls",
      "cmp",
      "lua_ls",
      "eslint",
    },
    mason = {
      lspconfig = {
        "bashls",
        "biome",
        "cssmodules_ls",
        "denols",
        "diagnosticls",
        "dockerls",
        "docker_compose_language_service",
        "eslint",
        "elixirls",
        "gopls",
        "html",
        -- 'htmx',
        "jsonls",
        "tsserver",
        "lua_ls",
        "marksman",
        "pyright",
        "rust_analyzer",
        "sqlls",
        "taplo",
        "tailwindcss",
        "templ",
        "terraformls",
        "lemminx",
        "yamlls",
        "zls",
      },
      nonels = {
        "prettier",
        "biome",
        "stylua",
        "black",
        "pylint",
        "eslint_d",
        "gofmt",
      },
    },
  },
  config = function(_, opts)
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    require("venom").setup()

    for _, script in pairs(opts.scripts) do
      require("plugins.lsp." .. script).load(opts, lspconfig, capabilities)
    end

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      desc = "LSP actions",
      callback = function(event)
        local options = function(desc)
          return {
            noremap = true,
            silent = true,
            buffer = event.buf,
            desc = desc,
          }
        end

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
      end,
    })
  end,
}
