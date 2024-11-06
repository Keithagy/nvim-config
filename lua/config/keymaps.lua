local function netrw_toggle_setup()
  vim.keymap.set('n', '<leader>e', function()
    if vim.bo.filetype == 'netrw' then
      -- If we're in netrw, get all listed buffers
      local buffers = vim.tbl_filter(function(buf)
        return vim.fn.buflisted(buf) == 1 and vim.bo[buf].filetype ~= 'netrw'
      end, vim.api.nvim_list_bufs())

      -- Sort buffers by last used timestamp
      table.sort(buffers, function(a, b)
        return vim.fn.getbufinfo(a)[1].lastused > vim.fn.getbufinfo(b)[1].lastused
      end)

      -- Switch to most recent buffer if available
      if #buffers > 0 then
        vim.cmd('buffer ' .. buffers[1])
      else
        vim.notify('No previous buffer available', vim.log.levels.INFO)
      end
    else
      -- If we're not in netrw, open it
      vim.cmd 'Ex'
    end
  end, { desc = 'Toggle between File [E]xplorer and most recent buffer' })
end

local function disable_arrow_keys_in_normal_mode()
  vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
  vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
  vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
  vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
end

local function split_window_nav_setup()
  -- Keybinds to make split navigation easier.
  --  Use CTRL+<hjkl> to switch between windows
  --  See `:help wincmd` for a list of all window commands
  vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move focus to the left window', remap = true })
  vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move focus to the right window', remap = true })
  vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move focus to the lower window', remap = true })
  vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move focus to the upper window', remap = true })
end

local function keymaps_setup()
  netrw_toggle_setup()
  disable_arrow_keys_in_normal_mode()
  split_window_nav_setup()

  -- Clear highlights on search when pressing <Esc> in normal mode
  --  See `:help hlsearch`
  vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

  -- Diagnostic keymaps
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
end

return keymaps_setup
