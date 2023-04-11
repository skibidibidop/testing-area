from survey import AnonymousSurvey

def test_store_single_response():
    """Test that a single response is stored properly"""
    question = "What was your first language?"
    language_survey = AnonymousSurvey(question)
    language_survey.store_response("English")
    assert "English" in language_survey.responses

