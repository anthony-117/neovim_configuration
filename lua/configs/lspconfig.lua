-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "tsserver", "eslint" }
local util = require "lspconfig/util"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- angular
lspconfig.angularls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = { "ngserver", "--stdio", "--tsProbeLocations", "", "--ngProbeLocations", "" },
  filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx" },
  root_dir = util.root_pattern "angular.json",
  settings = {},
}

-- elixir
lspconfig.elixirls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = { "elixir-ls" },
  filetypes = { "elixir", "eelixir", "heex", "surface" },
  root_dir = util.root_pattern(".git", "mix.exs"),
  settings = {
    elixirLS = {
      dialyzerEnabled = true,
      fetchDeps = false,
    }
  },
}

-- rust
lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "rust" },
  root_dir = util.root_pattern "Cargo.toml",
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
        buildScripts = {
          enable = true,
        },
      },
      checkOnSave = {
        command = "clippy",
      },
    },
  },
}
