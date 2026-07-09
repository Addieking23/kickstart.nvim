return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function() require('conform').format { async = true, lsp_format = 'fallback' } end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    ---@module 'conform'
    ---@type conform.setupOpts
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            -- biome (node) can take >500ms on its first cold-start run,
            -- which made the first format-on-save silently no-op
            timeout_ms = 3000,
            lsp_format = 'fallback',
          }
        end
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        python = { 'ruff' },
        --
        -- You can use 'stop_after_first' to run the first available formatter from the list
        javascript = { 'biome', 'biome-organize-imports' },
        javascriptreact = { 'biome', 'biome-organize-imports' },
        typescript = { 'biome', 'biome-organize-imports' },
        typescriptreact = { 'biome', 'biome-organize-imports' },
        toml = { 'tombi' },
      },
    },
  },
}
