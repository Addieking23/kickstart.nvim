return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    -- VeryLazy rather than VimEnter: which-key only has to exist by the time a
    -- key is actually held down, which is well after the UI is drawn.
    event = 'VeryLazy',
    ---@module 'which-key'
    ---@type wk.Opts
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      -- delay between pressing a key and opening which-key (milliseconds)
      delay = 0,
      icons = { mappings = vim.g.have_nerd_font },

      -- Document existing key chains
      spec = {
        { '<leader>s', group = '[S]earch', mode = { 'n', 'v' } },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } }, -- Enable gitsigns recommended keymaps first
        { '<leader>b', group = '[B]uffer' },
        { '<leader>c', group = '[C]ode' },
        { '<leader>q', group = '[Q]uit' },
        { '<leader>u', group = '[U]I' },
        { '<leader>w', group = '[W]indow' },
        { '<leader>x', group = 'Lists' },
        { '<leader><tab>', group = 'Tabs' },
        { 'gr', group = 'LSP Actions', mode = { 'n' } },
      },
    },
  },
}
