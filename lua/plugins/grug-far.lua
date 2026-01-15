-- search/replace in multiple files
return {
  'MagicDuck/grug-far.nvim',
  opts = { headerMaxWidth = 80, position = 'right' },
  cmd = { 'GrugFar', 'GrugFarWithin' },
  keys = {
    {
      PluginsKeyMapping.GurgFar.search.key,
      function()
        Utils.grugFar.open()
      end,
      mode = { 'n', 'x' },
      desc = PluginsKeyMapping.GurgFar.search.desc,
    },
  },
}
