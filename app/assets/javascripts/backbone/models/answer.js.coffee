class Quizback.Models.Answer extends Backbone.Model
  paramRoot: 'answer'
  
class Quizback.Collections.AnswersCollection extends Backbone.Collection
  model: Quizback.Models.Answer
  url: '/answers'
