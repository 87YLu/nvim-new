-- https://github.com/akinsho/bufferline.nvim
return {
  'akinsho/bufferline.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  event = 'VeryLazy',
  config = function()
    local buffers = {}

    local has_hbac, hbac = pcall(require, 'hbac.state')

    require('bufferline').setup({
      options = {
        close_command = function(n)
          Snacks.bufdelete(n)
        end,
        right_mouse_command = function(n)
          Snacks.bufdelete(n)
        end,
        diagnostics = 'nvim_lsp',
        show_tab_indicators = true,
        always_show_bufferline = true,
        diagnostics_indicator = function(_, _, diag)
          local icons = Icons.diagnostics
          local ret = (diag.error and icons.Error .. diag.error .. ' ' or '')
            .. (diag.warning and icons.Warn .. diag.warning or '')
          return vim.trim(ret)
        end,
        offsets = {
          {
            filetype = 'NvimTree',
            text = 'NvimTree',
            text_align = 'center',
          },
        },
      },
    })

    -- vim.g.keyset('n', keys.prev_tab, ':BufferLineCyclePrev<CR>', { desc = 'move to the previous tab' })
    -- vim.g.keyset('n', keys.next_tab, ':BufferLineCycleNext<CR>', { desc = 'move to the next tab' })
    -- vim.g.keyset('n', keys.close_tab, ':Bdelete!<CR>', { desc = 'close current tab' })
    -- vim.g.keyset('n', keys.close_other_tab, ':BufferLineCloseOthers<CR>', { desc = 'close other tab' })
    -- vim.g.keyset('n', keys.close_left_tab, ':BufferLineCloseLeft<CR>', { desc = 'close the left tab' })
    -- vim.g.keyset('n', keys.close_right_tab, ':BufferLineCloseRight<CR>', { desc = 'close the right tab' })
    -- vim.g.keyset('n', keys.pick_close, ':BufferLinePickClose<CR>', { desc = 'pick tab to close' })
  end,
}
