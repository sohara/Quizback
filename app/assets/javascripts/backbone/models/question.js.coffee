class Quizback.Models.Question extends Backbone.Model

  defaults:
    answered: false

  paramRoot: 'question'

class Quizback.Collections.QuestionsCollection extends Backbone.Collection
  model: Quizback.Models.Question
  url: '/questions'
