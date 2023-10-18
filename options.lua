-- set vim options here (vim.<first_key>.<second_key> = value)
return {
  opt = {
    -- set to true or false etc.
    relativenumber = true, -- sets vim.opt.relativenumber
    number = true, -- sets vim.opt.number
    spell = false, -- sets vim.opt.spell
    signcolumn = "auto", -- sets vim.opt.signcolumn to auto
    wrap = false, -- sets vim.opt.wrap
    guifont = 'Iosevka:h12',
    background="dark",
    -- background="light",
    linespace = 0

  },
  -- o = {
  --   giufont = 'Iosevka:h14'
  --
  -- },
  g = {
    neovide_hide_mouse_when_typing = true,
    neovide_refresh_rate = 100,
    neovide_fullscreen = true,
    neovide_profiler = false,
    neovide_cursor_animation_length= 0,

    everforest_background = "hard",
    everforest_enable_italic = 1,
    everforest_cursor = 'purple',
    everforest_diagnostic_text_highlight = 0,
    everforest_diagnostic_line_highlight = 1,
    everforest_diagnostic_virtual_text = "colored",
    everforest_current_word = 'italic',

    conjure_clj_additions_file_browser = 'firefox',
    mapleader = " ", -- sets vim.g.mapleader
    maplocalleader = "m",
    autoformat_enabled = false, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    cmp_enabled = true, -- enable completion at start
    autopairs_enabled = true, -- enable autopairs at start
    diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
    icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
    ui_notifications_enabled = true, -- disable notifications when toggling UI elements
    resession_enabled = true, -- enable experimental resession.nvim session management (will be default in AstroNvim v4)
  },
}
-- If you need more control, you can use the function()...end notation
-- return function(local_vim)
--   local_vim.opt.relativenumber = true
--   local_vim.g.mapleader = " "
--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
--
--   return local_vim
-- end
