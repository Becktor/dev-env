-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Toggle diagnostics visibility (works with Neovim 0.9+)
vim.keymap.set('n', '<leader>td', function()
  if vim.diagnostic.is_enabled then
    -- Neovim 0.10+
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
  else
    -- Neovim 0.9 fallback
    if vim.g.diagnostics_enabled == nil or vim.g.diagnostics_enabled then
      vim.diagnostic.disable()
      vim.g.diagnostics_enabled = false
    else
      vim.diagnostic.enable()
      vim.g.diagnostics_enabled = true
    end
  end
end, { desc = '[T]oggle [D]iagnostics' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Window navigation keymaps moved to tmux-navigator plugin for tmux-aware navigation