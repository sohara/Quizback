#= require application

describe "TestSession", ->
  it "has an id attribute", ->
    test_session = new Quizback.Models.TestSession(id: 12)
    expect(test_session.attributes.id).toEqual(12)
    
  it "requires an id attribute", ->
    eventSpy = sinon.spy()
    test_session = new Quizback.Models.TestSession()
    test_session.bind("error", eventSpy)
    test_session.set({})
    expect(eventSpy).toHaveBeenCalledOnce()
    expect(eventSpy).toHaveBeenCalledWith(
      test_session,
      "must have an id"
    )

  it "adds a answer to its answer collection when given an object with a value and a question_id", ->
    test_session = new Quizback.Models.TestSession({id: 5789})
    expect(test_session.answers.size()).toEqual(0)
    test_session.addAnswer({value: 3, question_id: 11})
    expect(test_session.answers.size()).toEqual(1)
    expect(test_session.answers.first().attributes).toEqual({
      value: 3,
      question_id: 11,
      test_session_id:5789
    })

