-- blink.cmp configuration for lazy.nvim
-- Docs: https://cmp.saghen.dev | Version: v1.10.2
--
-- Quick-start keymaps (default preset):
--   C-n / C-p    → next/prev item
--   C-y          → accept
--   C-e          → close menu
--   C-space      → open menu / toggle docs
--   C-b / C-f    → scroll docs
--   C-k          → toggle signature help
--   Tab / S-Tab  → jump snippet placeholders

return {
  'saghen/blink.cmp',

  -- rafamadriz/friendly-snippets ships a large curated snippet library.
  -- Remove this dependency if you manage snippets yourself (LuaSnip, etc.)
  dependencies = { 'rafamadriz/friendly-snippets' },

  -- Use a release tag so lazy.nvim downloads the matching pre-built binary
  -- for the Rust fuzzy matcher. Build from source instead with:
  --   build = "cargo build --release"
  version = '1.*',

  ---@module "blink.cmp"
  ---@type blink.cmp.Config
  opts = {

    -- ─── Keymap ────────────────────────────────────────────────────────────
    -- Presets: "default" | "super-tab" | "enter" | "none"
    --   "default"   → C-y to accept  (classic Vim style)
    --   "super-tab" → Tab to accept  (VS Code style)
    --   "enter"     → Enter to accept
    --
    -- Individual keys override the preset; set a key to `false` to disable it.
    keymap = {
      preset = 'default',

      -- Accept with Enter in addition to C-y (handy quality-of-life addition).
      -- Remove if you find yourself accidentally confirming items.
      -- ["<CR>"] = { "accept", "fallback" },

      -- Optionally expose docs scroll on familiar keys
      -- ["<C-d>"] = { "scroll_documentation_down", "fallback" },
      -- ["<C-u>"] = { "scroll_documentation_up", "fallback" },
    },

    -- ─── Appearance ────────────────────────────────────────────────────────
    appearance = {
      -- "mono" assumes a Nerd Font Mono variant (most common).
      -- Switch to "normal" if your Nerd Font is the non-mono variant.
      nerd_font_variant = 'normal',
    },

    -- ─── Completion ────────────────────────────────────────────────────────
    completion = {

      -- keyword: "prefix" matches only text before the cursor (default).
      -- Switch to "full" to also match text after the cursor.
      keyword = { range = 'prefix' },

      -- trigger: show completions as soon as you start typing a keyword.
      -- Set show_on_keyword = false to require a manual C-space trigger.
      trigger = {
        show_on_keyword = true,
        -- Also trigger after an LSP trigger character (e.g. "." in Lua).
        show_on_trigger_character = true,
      },

      -- list: how the completion list behaves when navigating.
      list = {
        selection = {
          -- preselect = true  → first item is highlighted automatically.
          -- auto_insert = true → highlighted item is "previewed" inline;
          --   C-e cancels the preview and restores your original text.
          preselect = true,
          auto_insert = false,
        },
      },

      -- accept: smart bracket insertion after functions/methods.
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },

      -- menu: the floating completion window.
      menu = {
        -- auto_show = true means the menu pops up while you type.
        -- Set to false if you prefer to call it manually with C-space.
        auto_show = true,

        -- Render columns similar to nvim-cmp: label + description on the
        -- left, kind icon + kind text on the right.
        draw = {
          columns = {
            { 'label', 'label_description', gap = 1 },
            { 'kind_icon', 'kind' },
          },
          -- Uncomment to syntax-highlight completion labels via Treesitter.
          -- This looks great but adds a tiny bit of overhead.
          -- treesitter = { 'lsp' },
        },
      },

      -- documentation: pop-up that shows the item's full docs.
      documentation = {
        -- auto_show = true → docs appear automatically after a short delay.
        -- Set to false and use C-space (or the show_documentation keymap)
        -- to open docs on demand only.
        auto_show = true,
        auto_show_delay_ms = 200,
      },

      -- ghost_text: shows a greyed-out inline preview of the top item.
      -- Works well alongside the popup menu, or as a standalone substitute
      -- if you set menu.auto_show = false.
      ghost_text = {
        enabled = false,
        -- Flip to true to show ghost text even while the menu is visible.
        -- show_with_menu = true,
      },
    },

    -- ─── Sources ───────────────────────────────────────────────────────────
    -- Built-in sources: lsp | path | snippets | buffer | omni
    -- Order here controls the default display ordering in the menu.
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },

      -- Per-filetype overrides.  `inherit_defaults = true` appends to the
      -- default list rather than replacing it.
      per_filetype = {
        -- Example: Neovim Lua gets lazydev completions (install lazydev.nvim).
        -- lua = { inherit_defaults = true, "lazydev" },
        -- Example: SQL files get vim-dadbod-completion.
        -- sql = { "dadbod" },
      },

      -- Provider-level tuning (all fields are optional).
      providers = {
        -- Example: lower the score of buffer completions so LSP items
        -- always win when both match.
        snippets = {
          min_keyword_length = 2,
          score_offset = 4,
        },
        lsp = {
          min_keyword_length = 3,
          score_offset = 3,
        },
        path = {
          min_keyword_length = 3,
          score_offset = 2,
        },
        buffer = {
          score_offset = -5,
          -- Only buffer-complete once you've typed at least 3 characters,
          -- to keep the menu tidy at the start of a word.
          min_keyword_length = 3,
        },

        -- Example: configure the lazydev community source (if installed).
        -- lazydev = {
        --   name = "LazyDev",
        --   module = "lazydev.integrations.blink",
        --   score_offset = 100,  -- always surfaces above LSP for Neovim Lua
        -- },
      },
    },

    -- ─── Fuzzy matching ────────────────────────────────────────────────────
    -- prefer_rust_with_warning  → use the Rust binary if available, warn otherwise.
    -- prefer_rust               → same but silent.
    -- lua                       → always use the pure-Lua fallback.
    fuzzy = {
      implementation = 'prefer_rust_with_warning',
    },

    -- ─── Signature help ────────────────────────────────────────────────────
    -- Shows function signatures while you type arguments.
    -- Toggle manually with C-k (default preset).
    signature = {
      enabled = true,
      -- window = { border = "rounded" },
    },

    -- ─── Cmdline mode ──────────────────────────────────────────────────────
    -- Enables completion in : command-line mode.
    -- The cmdline preset uses Tab/S-Tab to navigate and Enter to accept.
    cmdline = {
      enabled = true,
      keymap = { preset = 'cmdline' },
      completion = {
        menu = { auto_show = true },
        -- Cmdline list behaviour is intentionally separate from insert mode.
        list = { selection = { preselect = true, auto_insert = true } },
      },
    },
  },

  -- opts_extend lets other plugins (e.g. lazydev) append their sources to
  -- this list without touching your config.
  opts_extend = { 'sources.default' },
}
