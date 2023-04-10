from city_functions import get_address

def test_city_country():
    """Do names like 'santiago' and 'chile' work?"""
    formatted_address = get_address('santiago', 'chile')

    assert formatted_address == "Santiago, Chile"

