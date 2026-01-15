local M = {}

M.open = function(path)
  local prefills = {
    paths = path or Utils.path.get_project_root(),
    ransient = true,
    filesFilter = '!node_modules',
  }

  local grug_far = require('grug-far')

  if not grug_far.has_instance('explorer') then
    grug_far.open({ instanceName = 'explorer', prefills = prefills })
  else
    grug_far.get_instance('explorer'):open()
    grug_far.get_instance('explorer'):update_input_values(prefills, false)
  end
end

return M
