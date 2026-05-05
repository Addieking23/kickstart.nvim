return {
  {
    'rachartier/tiny-inline-diagnostic.nvim',
    priority = 1000,
    opts = {},
  },
  {
    'neovim/nvim-lspconfig',
    opts = { diagnostics = { virtual_text = false } },
  },
}
