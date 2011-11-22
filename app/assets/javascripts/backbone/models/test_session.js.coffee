class Quizback.Models.TestSession extends Backbone.Model

  initialize: ->
    @answers = new Quizback.Collections.AnswersCollection

  paramRoot: 'test_session'
