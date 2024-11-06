-- Highlight todo, notes, etc in comments
return {
  register = function(modules)
    table.insert(modules, { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } })
  end,
}
