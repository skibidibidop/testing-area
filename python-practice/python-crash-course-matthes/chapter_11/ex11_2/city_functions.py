def get_address(city, country, population=""):
    """Take City name and Country name, return
    formatted string 'City, Country'"""
    formatted = f"{city.title()}, {country.title()}"
    if population:
        formatted += f" - population {population}"

    return formatted

