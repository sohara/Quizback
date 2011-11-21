class Quizback.Views.QuestionView extends Backbone.View
  tagName: 'div'

  initialize: ->

  render: =>
    $(@el).html("<h3>Question #{@model.get('id')}</h3><p>#{@model.get('text')}</p>")
    return @
