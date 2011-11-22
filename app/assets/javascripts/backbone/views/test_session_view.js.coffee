class Quizback.Views.TestSessionView extends Backbone.View
  el: $('div#test')

  initialize: ->
    @current_index = 0

    # Load all the questions from json objext embedded in page
    @questions = new Quizback.Collections.QuestionsCollection(window.questions)

    # Bind the the answers collection 'add' event so that we can 
    # call the function to append to the answers collection view
    @model.answers.bind('add', @appendAnswer)

    # Assign the element for the list of answers to a variable for easy reference
    @answers_tag = $("ul")

    # Assign test_session_id to a variable. In real app this will be
    # obtained from a url param or something like that
    @test_session_id = 454
    
    @current_question = @questions.at(@current_index)
    @render()

  events: ->
    "click button.create": "createAnswer"
    "createAnswer": "nextQuestion"

  render: =>
    @displayQuestion @current_question
    #@el.append("<h3>Question number #{@current_question}</h3>")
    $("#buttons").append(@allButtons)

  createAnswer: (e) ->
    value = $(e.currentTarget).val()
    answer = new Quizback.Models.Answer
    answer.bind "error", @raiseError
    answer.set({value: value, question_id: @current_question.get('id'), test_session_id: @test_session_id})
    answer.save null,
      success: (model, response) ->
        console.log "Successfuly saved #{model.constructor.name}"
      error: (model, response) ->
        console.log "Error while saving #{model.constructor.name}"
    @model.answers.add(answer)
    @nextQuestion() if @current_index < 19

  nextQuestion: =>
    @current_index++
    @current_question = @questions.at(@current_index)
    @displayQuestion()

  appendAnswer: (answer) =>
    answer_view = new Quizback.Views.AnswerView( {model: answer} )
    @answers_tag.append(answer_view.render().el)

  raiseError: (model, error) ->
    console.log("The following error: #{error} occurred on the following model: #{model}")
    console.log error

  displayQuestion: =>
    question_view = new Quizback.Views.QuestionView( {model: @current_question} )
    $('div#question').html(question_view.render().el).hide(0).fadeIn('slow')

  allButtons: ->
    string = "<button class='create' value='1'>almost never</button>"
    string += "<button class='create' value='2'>rarely</button>"
    string += "<button class='create' value='3'>sometimes</button>"
    string += "<button class='create' value='4'>often</button>"
    string += "<button class='create' value='5'>almost always</button>"
    return string

$ ->
  window.test_session = new Quizback.Models.TestSession()
  window.test_view = new Quizback.Views.TestSessionView( {model: window.test_session})