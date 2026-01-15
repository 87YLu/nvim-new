local initSnacks = function()
  local map = vim.keymap.set
  -- buffer
  local bufferKeys = PluginsKeyMapping.Snacks.buffer
  map('n', bufferKeys.delete.key, function()
    Snacks.bufdelete()
  end, { desc = bufferKeys.delete.desc })
  map('n', bufferKeys.deleteOther.key, function()
    Snacks.bufdelete.other()
  end, { desc = bufferKeys.deleteOther.desc })

  -- git
  local gitKeys = PluginsKeyMapping.Snacks.git
  map('n', gitKeys.lazygit.key, function()
    Snacks.lazygit({
      cwd = Utils.path.get_project_root(),
    })
  end, { desc = gitKeys.lazygit.desc })
  map({ 'n', 'x' }, gitKeys.browser.key, function()
    Snacks.gitbrowse()
  end, { desc = gitKeys.browser.desc })
end

return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    scroll = { enabled = not vim.g.vscode },
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    indent = { enabled = true },
    picker = { enabled = true },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
  },
  init = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        initSnacks()
      end,
    })
  end,
}
