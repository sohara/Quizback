#= require application

describe "TestSession", ->
  it "has an id attribute", ->
    test_session = new Quizback.Models.TestSession({id: 12})
    expect(test_session.attributes.id).toEqual(12)
