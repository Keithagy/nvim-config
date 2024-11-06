-- top-level theming options
local function top_level_theming_setup()
  vim.g.have_nerd_font = true
  vim.opt.background = 'dark'
  vim.api.nvim_create_autocmd('ColorScheme', {
    pattern = '*',
    callback = function()
      vim.api.nvim_set_hl(0, 'NormalNC', { bg = '#1c1c1c' })
    end,
  })
  vim.cmd.colorscheme 'default'
  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = 'single',
    -- Other border options:
    -- border = "single",
    -- border = "double",
    -- border = "shadow",

    -- You can also customize width if needed
    -- width = 60,

    -- And add highlighting
    -- highlight = "FloatBorder:Normal",
  })
end

-- [[Plugin-specific theming setup]]
local function nvim_cmp_window_setup()
  return {
    completion = {
      border = 'single',
      -- Yuu can also use other border styles:
      -- border = "single",
      -- border = "double",
      -- border = "shadow",
      winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None',
    },
    documentation = {
      border = 'single',
      winhighlight = 'Normal:CmpDoc',
    },
  }
end

return {
  top_level_theming_setup = top_level_theming_setup,
  plugins = {
    nvim_cmp_window_setup = nvim_cmp_window_setup,
  },
}
