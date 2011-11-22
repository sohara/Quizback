class Quizback.Models.TestSession extends Backbone.Model

  initialize: ->
    # Set up an empty answers collection to be filled during test session
    @answers = new Quizback.Collections.AnswersCollection

    # Also set up questions collection loaded with array of question objects
    # embedded in page
    @questions = new Quizback.Collections.QuestionsCollection(window.questions)

  validate: (attrs) ->
    unless (attrs.id?)
      return "must have an id"

  addAnswer: (attrs) ->
    attrs.test_session_id = @id
    console.log attrs
    answer = new Quizback.Models.Answer
    answer.bind "error", @raiseError
    answer.save attrs,
      success: (model, response) ->
        console.log "Successfuly saved #{model.constructor.name}"
      error: (model, response) ->
        console.log "Error while saving #{model.constructor.name}"
    @answers.add(answer)

  paramRoot: 'test_session'
