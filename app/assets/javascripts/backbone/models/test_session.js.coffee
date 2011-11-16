class Quizback.Models.TestSession extends Backbone.Model

  paramRoot: 'test_session'

class Quizback.Collections.TestSessionsCollection extends Backbone.Collection
  model: Quizback.Models.TestSession
  url: '/test_sessions'
