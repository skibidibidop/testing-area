from city_functions import get_address

def test_city_country():
    """Do names like 'santiago' and 'chile' work?"""
    formatted_address = get_address('santiago', 'chile')

    assert formatted_address == "Santiago, Chile"

def test_city_country_population():
    """Do names like 'santiago' and 'chile', and
    numbers like 30000 work?"""
    formatted_address = get_address('santiago', 'chile',
                                    30000)
    correct_format = "Santiago, Chile - population 30000"

    assert formatted_address == correct_format

