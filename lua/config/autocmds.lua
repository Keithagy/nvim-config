-- Generally speaking, autocmds go here only if they don't depend on some package.
-- In particular, lsp configuration autocmds should sit in the plugin config.
local autocmds = {
  TextYankPost = {
    {
      desc = 'Highlight when yanking (copying) text',
      group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
      callback = function()
        vim.highlight.on_yank()
      end,
    },
  },
  BufWritePre = {
    {
      desc = 'Trim whitespace before save',
      group = vim.api.nvim_create_augroup('trim-whitespace-before-save', { clear = true }),
      command = [[%s/\s\+$//e]],
    },
  },
}

local function autocmds_setup()
  for event, autocmds_for_event in pairs(autocmds) do
    for _, autocmd in pairs(autocmds_for_event) do
      vim.api.nvim_create_autocmd(event, autocmd)
    end
  end
end

return autocmds_setup
