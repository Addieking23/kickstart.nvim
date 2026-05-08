return {
  {
    'windwp/nvim-ts-autotag',
    -- Don't lazy load — the plugin is efficient about when it activates.
    -- If you must lazy load, use these events:
    -- event = { "BufReadPre", "BufNewFile" },
    opts = {
      opts = {
        enable_close = true, -- Auto-close tags when you type >
        enable_rename = true, -- Rename closing tag when you rename opening tag (ciw, etc.)
        enable_close_on_slash = false, -- Don't auto-close on </  (can conflict with some workflows)
      },

      -- Per-filetype overrides — useful when global opts misbehave in a specific language.
      -- For example, nvim-cmp already handles </ completion in plain HTML for some setups:
      per_filetype = {
        ['html'] = {
          enable_close = true,
        },
        ['markdown'] = {
          enable_close = false, -- Markdown angle brackets aren't usually HTML tags
        },
      },
    },
  },
}
