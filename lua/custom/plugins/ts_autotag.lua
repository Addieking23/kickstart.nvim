return {
  {
    'windwp/nvim-ts-autotag',

    -- The plugin attaches from a FileType autocmd, so loading it on the
    -- filetypes it actually supports is both lazy and lossless — lazy.nvim
    -- re-fires FileType after the load, so the triggering buffer still gets
    -- attached. This is the full set of filetypes the plugin knows about
    -- (see its `aliases` table); trim it if you never edit some of them.
    ft = {
      'astro',
      'blade',
      'dot',
      'elixir',
      'eruby',
      'glimmer',
      'handlebars',
      'hbs',
      'heex',
      'html',
      'htmlangular',
      'htmldjango',
      'javascript',
      'javascript.glimmer',
      'javascript.jsx',
      'javascriptreact',
      'liquid',
      'markdown',
      'php',
      'rescript',
      'rust',
      'svelte',
      'templ',
      'twig',
      'typescript',
      'typescript.glimmer',
      'typescript.tsx',
      'typescriptreact',
      'vento',
      'vue',
      'xml',
    },
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
