-- [[ Setting options ]]
-- See `:help vim.opt`
local function line_num_setup()
  -- Make relative line numbers default
  vim.opt.number = true
  vim.opt.relativenumber = true
end
local function options_setup()
  line_num_setup()

  vim.opt.mouse = 'a' -- useful for resizing splits
  vim.opt.showmode = false -- Don't show the mode, since it's already in the status line
  vim.opt.breakindent = true -- See `:help breakindent`
  vim.opt.undofile = true -- Save undo history
  -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
  vim.opt.ignorecase = true
  vim.opt.smartcase = true
  vim.opt.signcolumn = 'yes' -- Keep signcolumn on by default
  vim.opt.updatetime = 50 -- Decrease update time
  -- Decrease mapped sequence wait time
  -- Displays which-key popup sooner
  vim.opt.timeoutlen = 200
  -- Configure how new splits should be opened
  vim.opt.splitright = true
  vim.opt.splitbelow = true
  -- Sets how neovim will display certain whitespace characters in the editor.
  --  See `:help 'list'`
  --  and `:help 'listchars'`
  vim.opt.list = true
  vim.opt.listchars = {
    space = '⋅', -- spaces
    eol = '↲', -- end-of-line chars
    tab = '» ', -- tabs
    trail = '·', -- trailing spaces
    extends = '❯', -- Show when line continues beyond right
    precedes = '❮', -- Show when line continues beyond left
    nbsp = '␣', -- Show non-breakable spaces
    multispace = '···', -- Show multiple spaces as dots
    lead = '·', -- Show leading spaces
  }
  -- Preview substitutions live, as you type!
  vim.opt.inccommand = 'split'
  -- Show which line your cursor is on
  vim.opt.cursorline = true
  -- Minimal number of screen lines to keep above and below the cursor.
  vim.opt.scrolloff = 20
end

return options_setup
