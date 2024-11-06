-- Code here is first to get called in setup

-- Must happen before plugins are loaded (otherwise wrong leader will be used)
local function leader_setup()
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '
end

local function first_setup()
  leader_setup()
  --  Schedule the setting after `UiEnter` because it can increase startup-time.
  vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus' --  See `:help 'clipboard'`
  end)
end

return first_setup
