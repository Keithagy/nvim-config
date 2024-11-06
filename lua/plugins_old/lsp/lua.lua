local lua_lsp_plugins = {
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'Bilal2453/luvit-meta', lazy = true },
}

local nvim_cmp_config = function(sources)
  table.insert(sources, {
    name = 'lazydev',
    group_index = 0, -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
  })
end

return {
  register = function(modules)
    vim.list_extend(modules, lua_lsp_plugins)
  end,
  nvim_cmp_config = nvim_cmp_config,
}
