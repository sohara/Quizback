#= require application

describe "Question", ->
  data = null

  beforeEach ->
    data = 
      id: 1
      text: "How do you feel about this?"

  
  it "has a text attribute", ->
    question = new Quizback.Models.Question(data)
    expect(question.attributes.text).toEqual("How do you feel about this?")

  it "has a text attribute", ->
    question = new Quizback.Models.Question(data)
    expect(question.attributes.answered).toEqual(false)

describe "QuestionsCollection", ->
  jsonData = null

  beforeEach ->
    jsonData =
    [
      {id: 1, text: "Are you trustworthy?"},
      {id: 2, text: "Are you sure you're really trustworthy?"}
    ]

  it "can populate a collection from json data", ->
    questions = new Quizback.Collections.QuestionsCollection
    questions.add data for data in jsonData
    expect(questions.length).toEqual(2)
    expect(questions.models[0].get('text')).toEqual("Are you trustworthy?")
