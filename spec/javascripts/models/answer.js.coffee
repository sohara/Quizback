#= require application

describe "Answer", ->

  beforeEach ->
    @answer = new Quizback.Models.Answer()
    @eventSpy = sinon.spy()
  
  it "requires a value attribute", ->
    @answer.bind("error", @eventSpy)
    @answer.set({question_id: "2", test_session_id: "53562"})
    expect(@eventSpy).toHaveBeenCalledOnce()
    expect(@eventSpy).toHaveBeenCalledWith(
      @answer,
      "cannot have an empty value"
    )

  it "requires a question_id attribute", ->
    @answer.bind("error", @eventSpy)
    @answer.set({value: "2"})
    expect(@eventSpy).toHaveBeenCalledOnce()
    expect(@eventSpy).toHaveBeenCalledWith(
      @answer,
      "must have a question id"
    )

  it "requires a test_session_id attribute", ->
    @answer.bind("error", @eventSpy)
    @answer.set({value: "2", question_id: "5", test_session_id: null})
    expect(@eventSpy).toHaveBeenCalledOnce()
    expect(@eventSpy).toHaveBeenCalledWith(
      @answer,
      "must have a test session id"
    )

  it "sets valid attributes without erros", ->
    @answer.bind("error", @eventSpy)
    @answer.set({value: "2", question_id: "5", test_session_id: "3435"})
    expect(@eventSpy).not.toHaveBeenCalled()
    expect(@answer.get('question_id')).toEqual("5")
