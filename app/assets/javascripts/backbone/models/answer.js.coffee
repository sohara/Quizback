class Quizback.Models.Answer extends Backbone.Model
  paramRoot: 'answer'
  url: '/answers'

  validate: (attrs) ->
    unless (attrs.value?)
      return "cannot have an empty value"
    unless (attrs.question_id?)
      return "must have a question id"
    unless (attrs.test_session_id?)
      return "must have a test session id"
  
class Quizback.Collections.AnswersCollection extends Backbone.Collection
  model: Quizback.Models.Answer
  url: '/answers'
