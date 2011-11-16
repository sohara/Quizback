#= require application

describe "TestSession", ->
  it "has an id attribute", ->
    test_session = new Quizback.Models.TestSession(12)
    expect(test_session.id).toEqual(12)
