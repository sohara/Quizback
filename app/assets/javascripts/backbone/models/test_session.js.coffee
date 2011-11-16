class Quizback.Models.TestSession extends Backbone.Model
  constructor: (@id) ->

  paramRoot: 'test_session'

  id: ->
    @id

  defaults:
    id: null
  
class Quizback.Collections.TestSessionsCollection extends Backbone.Collection
  model: Quizback.Models.TestSession
  url: '/test_sessions'
