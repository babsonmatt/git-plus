{BufferedProcess} = require 'atom'
ListView = require './remote-list-view'
StatusView = require './status-view'

dir = -> atom.project.getRepo()?.getWorkingDirectory() ? atom.project.getPath()

gitFetch = ->
  # first get the remote repos
  new BufferedProcess(
    command: 'git'
    args: ['remote']
    options:
      cwd: dir()
    stdout: (data) ->
      new ListView(data.toString(), 'fetch')
    stderr: (data) ->
      new StatusView(type: 'alert', message: data.toString())
  )

module.exports = gitFetch
