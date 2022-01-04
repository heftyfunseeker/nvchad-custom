-- IMPORTANT NOTE : This is the user config, can be edited. Will be preserved if updated with internal updater
-- This file is for NvChad options & tools, custom settings are split between here and 'lua/custom/init.lua'

local M = {}
M.options, M.ui, M.mappings, M.plugins = {}, {}, {}, {}

-- NOTE: To use this, make a copy with `cp example_chadrc.lua chadrc.lua`

--------------------------------------------------------------------

-- To use this file, copy the strucutre of `core/default_config.lua`,
-- examples of setting relative number & changing theme:

M.options = {
   relativenumber = true,
   expandtab = true,
   shiftwidth = 4,
   tabstop = 4, -- Number of spaces that a <Tab> in the file counts for
   autoindent = true,
   smartindent = true,
   smarttab = true,
}

M.mappings = {
   plugins = {
      telescope = {
         buffers = "<leader>fb",
         find_files = "<C-p>",
         find_hiddenfiles = "<leader>fa",
         git_commits = "<leader>cm",
         git_status = "<leader>gt",
         help_tags = "<leader>fh",
         live_grep = "<leader>f",
         oldfiles = "<leader>fo",
         themes = "<leader>th", -- NvChad theme picker
      },
      -- file explorer/tree
      nvimtree = {
         toggle = "<C-n>",
         focus = "<leader>e",
      },
      dashboard = {
         bookmarks = "<leader>bm",
         new_file = "<leader>fn", -- basically create a new buffer
         open = "<leader>db", -- open dashboard
         session_load = "<leader>pl", -- load a saved session
         session_save = "<leader>ps", -- save a session
      },
   },
}

M.ui = {
   theme = "chadracula",
}

-- NvChad included plugin options & overrides
M.plugins = {
   status = {
      autosave = false, -- to autosave files
      blankline = true, -- show code scope with symbols
      bufferline = true, -- list open buffers up the top, easy switching too
      colorizer = false, -- color RGB, HEX, CSS, NAME color codes
      comment = true, -- easily (un)comment code, language aware
      dashboard = true, -- NeoVim 'home screen' on open
      esc_insertmode = true, -- map to <ESC> with no lag
      feline = true, -- statusline
      gitsigns = true, -- gitsigns in statusline
      lspsignature = true, -- lsp enhancements
      neoscroll = false, -- smooth scroll
      telescope_media = false, -- media previews within telescope finders
      truezen = false, -- distraction free & minimalist UI mode
      vim_matchup = true, -- % operator enhancements
      cmp = true,
   },
   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },
   -- To change the Packer `config` of a plugin that comes with NvChad,
   -- add a table entry below matching the plugin github name
   --              '-' -> '_', remove any '.lua', '.nvim' extensions
   -- this string will be called in a `require`
   --              use "(custom.configs).my_func()" to call a function
   --              use "custom.blankline" to call a file
   default_plugin_config_replace = {
      nvim_treesitter = "custom.plugins.configs.treesitter",
      dashboard = "custom.plugins.configs.dashboard",
      telescope = "custom.plugins.configs.telescope"
   },
}
return M
