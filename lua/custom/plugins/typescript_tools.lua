-- ~/.config/nvim/lua/plugins/typescript-tools.lua
-- Requires: plenary.nvim, nvim-lspconfig (as dependencies)

return {
  'pmizio/typescript-tools.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'neovim/nvim-lspconfig',
  },
  ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
  opts = {
    -- ─── LSP on_attach ───────────────────────────────────────────────
    on_attach = function(client, bufnr)
      -- Disable tsserver formatting if you use prettier/eslint via null-ls/conform
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false

      local map = function(mode, lhs, rhs, desc) vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc }) end

      -- ── Standard LSP keys ──────────────────────────────────────────
      -- map("n", "gd",         vim.lsp.buf.definition,      "Go to definition")
      -- map("n", "gD",         vim.lsp.buf.type_definition,  "Go to type definition")
      -- map("n", "gi",         vim.lsp.buf.implementation,   "Go to implementation")
      -- map("n", "gr",         vim.lsp.buf.references,       "References")
      -- map("n", "K",          vim.lsp.buf.hover,            "Hover docs")
      -- map("n", "<leader>rn", vim.lsp.buf.rename,           "Rename symbol")
      -- map("n", "<leader>ca", vim.lsp.buf.code_action,      "Code action")

      -- ── typescript-tools specific commands ─────────────────────────
      map('n', '<leader>to', '<cmd>TSToolsOrganizeImports<cr>', 'TS: Organize imports')
      map('n', '<leader>ts', '<cmd>TSToolsSortImports<cr>', 'TS: Sort imports')
      map('n', '<leader>tu', '<cmd>TSToolsRemoveUnusedImports<cr>', 'TS: Remove unused imports')
      map('n', '<leader>tU', '<cmd>TSToolsRemoveUnused<cr>', 'TS: Remove all unused')
      map('n', '<leader>ta', '<cmd>TSToolsAddMissingImports<cr>', 'TS: Add missing imports')
      map('n', '<leader>tf', '<cmd>TSToolsFixAll<cr>', 'TS: Fix all')
      map('n', '<leader>tg', '<cmd>TSToolsGoToSourceDefinition<cr>', 'TS: Go to source def')
      map('n', '<leader>tR', '<cmd>TSToolsRenameFile<cr>', 'TS: Rename file')
      map('n', '<leader>tF', '<cmd>TSToolsFileReferences<cr>', 'TS: File references')
    end,

    -- ─── Diagnostic handler (filter noisy errors) ────────────────────
    -- handlers = {
    --   ['textDocument/publishDiagnostics'] = (function()
    --     local api = require 'typescript-tools.api'
    --     return api.filter_diagnostics {
    --       80006, -- "This may be converted to an async function"
    --       -- Add other TS error codes you want to suppress
    --     }
    --   end)(),
    -- },

    -- ─── Core settings ───────────────────────────────────────────────
    settings = {
      -- Spawn a dedicated tsserver instance just for diagnostics — keeps
      -- completions fast while diagnostics run in the background
      separate_diagnostic_server = true,

      -- Fire diagnostics when leaving insert mode (less noisy than "change")
      publish_diagnostic_on = 'insert_leave',

      -- Expose useful actions directly through vim.lsp.buf.code_action()
      expose_as_code_action = {
        'fix_all',
        'add_missing_imports',
        'remove_unused_imports',
        'organize_imports',
      },

      -- "auto" means Node decides the heap limit — fine for most machines.
      -- On large monorepos you can pin to e.g. 8192 (MB)
      tsserver_max_memory = 'auto',

      -- Locale for tsserver error messages
      tsserver_locale = 'en',

      -- Complete function calls with parentheses & parameter snippets
      complete_function_calls = true,

      -- Needed by most completion plugins to show full text-edit completions
      include_completions_with_insert_text = true,

      -- CodeLens: "off" | "all" | "implementations_only" | "references_only"
      -- NOTE: experimental — can hurt perf on large files
      code_lens = 'off',
      disable_member_code_lens = true,

      -- Auto-close JSX tags (disable if you use nvim-ts-autotag to avoid conflicts)
      jsx_close_tag = {
        enable = false,
        filetypes = { 'javascriptreact', 'typescriptreact' },
      },

      -- ── Inlay hints & smart completions ──────────────────────────
      tsserver_file_preferences = {
        -- Inlay hints (shown inline, requires nvim >= 0.10 + a renderer)
        includeInlayParameterNameHints = 'all', -- "none"|"literals"|"all"
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,

        -- Completions
        includeCompletionsForModuleExports = true,
        includeCompletionsForImportStatements = true,
        includeCompletionsWithSnippetText = true,
        includeAutomaticOptionalChainCompletions = true,

        -- Prefer single quotes in auto-imports
        quotePreference = 'single',

        -- Jump to the actual .ts source instead of .d.ts declarations
        includePackageJsonAutoImports = 'auto',
      },

      -- ── Formatter preferences ─────────────────────────────────────
      -- (Only relevant if you haven't disabled tsserver formatting above)
      tsserver_format_options = {
        allowIncompleteCompletions = false,
        allowRenameOfImportPath = true,
        -- Match your project's style:
        indentSize = 2,
        convertTabsToSpaces = true,
        trimTrailingWhitespace = true,
        insertSpaceAfterCommaDelimiter = true,
        insertSpaceAfterSemicolonInForStatements = true,
        insertSpaceBeforeAndAfterBinaryOperators = true,
        insertSpaceAfterKeywordsInControlFlowStatements = true,
        insertSpaceAfterFunctionKeywordForAnonymousFunctions = true,
        insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
        semicolons = 'insert', -- "insert" | "remove" | "ignore"
      },
    },
  },
}
