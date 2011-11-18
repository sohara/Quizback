class Quizback.Views.TestView extends Backbone.View
  el: $('div#test')

  initialize: ->
    @current_index = 0
    #jsonData = [
      #{id: 1, text: "Question 1"},
      #{id: 2, text: "Question 2"},
      #{id: 3, text: "Question 3"},
      #{id: 4, text: "Question 4"}
    #]
    @questions = new Quizback.Collections.QuestionsCollection(window.questions)
    @current_question = @questions.at(@current_index)
    @render()

  events: ->
    "click button.create": "createAnswer"

  render: =>
    @displayQuestion @current_question
    #@el.append("<h3>Question number #{@current_question}</h3>")
    @el.append(@allButtons)

  createAnswer: (e) ->
    @current_index++
    @current_question = @questions.at(@current_index)
    @displayQuestion @current_question
    @el.append("<p>Answer #{@current_index} created with value #{$(e.currentTarget).val()}")

  displayQuestion: (question) =>
    question_view = new Quizback.Views.QuestionView( {model: question} )
    $('div#question').html(question_view.render().el)

  allButtons: ->
    string = "<button class='create' value='1'>almost never</button>"
    string += "<button class='create' value='2'>rarely</button>"
    string += "<button class='create' value='3'>sometimes</button>"
    string += "<button class='create' value='4'>often</button>"
    string += "<button class='create' value='5'>almost always</button>"
    return string

$ ->
  test_view = new Quizback.Views.TestView()
