InsalesLiquidSnippetsView = require './insales-liquid-snippets-view'
{CompositeDisposable} = require 'atom'

module.exports = InsalesLiquidSnippets =
  insalesLiquidSnippetsView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @InsalesLiquidSnippetsView = new InsalesLiquidSnippetsView(state.insalesLiquidSnippetsViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @insalesLiquidSnippetsView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'insales-liquid-snippets:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @insalesLiquidSnippetsView.destroy()

  serialize: ->
    insalesLiquidSnippetsViewState: @insalesLiquidSnippetsView.serialize()

  toggle: ->
    console.log 'InsalesLiquidSnippets was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
