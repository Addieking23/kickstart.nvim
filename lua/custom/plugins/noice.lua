return {
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      -- add any options here
    },
    -- noice routes notifications through vim.notify, which snacks.notifier
    -- already provides — no separate notification plugin needed
    dependencies = { 'MunifTanjim/nui.nvim' },
  },
}
