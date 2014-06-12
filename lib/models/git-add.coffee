git = require '../git'
StatusView = require '../views/status-view'

gitAdd = (addAll=false) ->
  file = atom.project.getRepo().relativize atom.workspace.getActiveEditor()?.getPath()
  file = '.' if addAll
  git.cmd(
    args: ['add', '--all', file],
    exit: (e) ->
      if e is 0
        file = 'all files' if file is '.'
        new StatusView(type: 'success', message: "Added #{file}")
  )
    
module.exports = gitAdd
