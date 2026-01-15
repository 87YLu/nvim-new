-- search/replace in multiple files
return -- which-key helps you remember key bindings by showing a popup
-- with the active keybindings of the command you started typing.
{
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts_extend = { 'spec' },
  opts = {
    preset = 'helix',
    defaults = {},
    spec = {
      {
        mode = { 'n', 'x' },
        { '<leader>c', group = 'code' },
        { '<leader>f', group = 'file/find' },
        { '<leader>g', group = 'git' },
        { '<leader>gh', group = 'hunks' },
        { '<leader>q', group = 'quit/session' },
        { '<leader>s', group = 'search' },
        { '<leader>u', group = 'ui' },
        { '[', group = 'prev' },
        { ']', group = 'next' },
        { 'g', group = 'goto' },
        { 'gs', group = 'surround' },
        { 'z', group = 'fold' },
        { '<leader>b', group = 'buffer' },
        { '<leader>w', group = 'windows' },
      },
    },
  },
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show({ global = false })
      end,
      desc = 'Buffer Keymaps (which-key)',
    },
  },
  -- config = function(_, opts)
  --   local wk = require('which-key')
  --   wk.setup(opts)
  -- end,
}