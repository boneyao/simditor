
class ItalicButton extends Button

  name: 'italic'

  icon: 'italic'

  htmlTag: 'i'

  disableTag: 'pre'

  shortcut: 'cmd+i'

  _init: ->
    if @editor.util.os.mac
      @title = @title + ' ( Cmd + i )'
    else
      @title = @title + ' ( Ctrl + i )'
      @shortcut = 'ctrl+i'

    super()

  status: ($node) ->
    @setDisabled $node.is(@disableTag) if $node?
    return @disabled if @disabled

    active = document.queryCommandState('italic') is true
    @setActive active
    active

  command: ->
    document.execCommand 'italic'
    @editor.trigger 'valuechanged'

    # italic command won't trigger selectionchange event automatically
    $(document).trigger 'selectionchange'


Simditor.Toolbar.addButton ItalicButton

