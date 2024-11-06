--[[
Helpful resources:
  - Lua quick reference: https://learnxinyminutes.com/docs/lua/
  - :help lua-guide (or :help) in general
		set winhighlight=Normal:MyNormal,NormalNC:MyNormalNC
 - (or HTML version): https://neovim.io/doc/user/lua-guide.html
  - :checkhealth for diagnostics
--]]

require 'config.first'()
require 'config.lazy'()
require 'config.autocmds'()
require 'config.keymaps'()
require 'config.options'()
require ('config.theming').top_level_theming_setup()
