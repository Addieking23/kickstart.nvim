return {
  -- Detection happens on BufReadPost, so loading at BufReadPre is early enough
  -- to still catch the first file opened.
  { 'NMAC427/guess-indent.nvim', event = { 'BufReadPre', 'BufNewFile' }, cmd = 'GuessIndent', opts = {} },

  -- Alternatively, use `config = function() ... end` for full control over the configuration.
  -- If you prefer to call `setup` explicitly, use:
  --    {
  --        'lewis6991/gitsigns.nvim',
  --        config = function()
  --            require('gitsigns').setup({
  --                -- Your gitsigns configuration here
  --            })
  --        end,
  --    }
  --
  -- Here is a more advanced example where we pass configuration
  -- options to `gitsigns.nvim`.
  --
  -- See `:help gitsigns` to understand what the configuration keys do
}
