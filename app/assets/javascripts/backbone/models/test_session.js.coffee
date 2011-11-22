class Quizback.Models.TestSession extends Backbone.Model

  initialize: ->
    @answers = new Quizback.Collections.AnswersCollection

  validate: (attrs) ->
    unless (attrs.id?)
      return "must have an id"

  paramRoot: 'test_session'
