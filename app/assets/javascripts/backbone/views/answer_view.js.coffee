class Quizback.Views.AnswerView extends Backbone.View
  tagName: 'li'

  initialize: ->

  render:  =>
    $(@el).html("Answer: Value #{@model.get('value')} for Question # #{@model.get('question_id')}")
    return @
