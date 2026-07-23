return {
  {
    'miikanissi/modus-themes.nvim',
    -- The colorscheme is the one thing that genuinely has to be in place
    -- before the first frame, so it stays eager and high priority.
    lazy = false,
    priority = 1000,
    config = function()
      require('modus-themes').setup {
        style = 'modus_vivendi',
        variants = {
          modus_vivendi = 'deuteranopia',
        },
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
        },
      }
      vim.cmd [[colorscheme modus]]
    end,
  },
}
