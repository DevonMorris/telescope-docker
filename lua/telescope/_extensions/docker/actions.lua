local action_state = require('telescope.actions.state')
local utils = require('telescope.utils')
local dutils = require('telescope._extensions.docker.utils')
local transform_mod = require('telescope.actions.mt').transform_mod
local dactions = {}

dactions.docker_start_toggle = function(prompt_bufnr)
  local cwd = action_state.get_current_picker(prompt_bufnr).cwd
  local selection = action_state.get_selected_entry()

  local cmd = ""
  if selection.status == 'running' then
    cmd = "stop"
  else
    cmd = "start"
  end
  local job = dutils.get_job_from_cmd({ 'docker', cmd, selection.name }, cwd)
  job:sync()
end

dactions = transform_mod(dactions)
return dactions
