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

