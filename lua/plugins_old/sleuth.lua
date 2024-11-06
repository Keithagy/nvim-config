return {
  register = function(modules)
    table.insert(modules, { 'tpope/vim-sleuth' }) -- Detect tabstop and shiftwidth automatically
  end,
}
