return {
  {
    'miikanissi/modus-themes.nvim',
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
