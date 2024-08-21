return {
  'ThePrimeagen/harpoon',
  config = function(plug, opts)
    require('harpoon').setup(opts)

    require('telescope').load_extension 'harpoon'

    vim.keymap.set('n', '<leader>am', function()
      require('harpoon.mark').add_file()
    end, { desc = '[H]arpoon [M]ark' })

    vim.keymap.set('n', '<leader>al', ':Telescope harpoon marks<ESC>', { desc = '[H]arpoon [L]ist Marks' })

    for i = 1, 9, 1 do
      vim.keymap.set('n', '<leader>a' .. i, function()
        require('harpoon.ui').nav_file(i)
      end, { desc = '[H]arpoon navigate file [' .. i .. ']' })
    end
  end,
  dependencies = { { 'nvim-lua/plenary.nvim' }, { 'nvim-telescope/telescope.nvim' } },
}
