local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "ts_ls", "eslint" }
local util = require "lspconfig/util"

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.angularls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "ngserver", "--stdio", "--tsProbeLocations", "", "--ngProbeLocations", "" },
  filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx" },
  root_dir = util.root_pattern "angular.json",
  settings = {},
}

lspconfig.elixirls.setup {
  on_attach = on_attach,
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

lspconfig.svelte.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "svelte" },
  root_dir = util.root_pattern("svelte.config.js", "svelte.config.ts", "package.json", ".git"),
  settings = {
    svelte = {
      plugin = {
        html = { completions = { enable = true, emmet = false } },
        svelte = { defaultScriptLanguage = "ts" },
      },
    },
  },
}
