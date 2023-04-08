# Write describe_city(city, country="The Philippines")
# Print "<City> is in <country>"
# Print 3x, at least 1 should not be default country

def describe_city(city, country="The Philippines"):
    """Take strings for city and country"""
    print(f"{city.title()} is in {country.title()}.")

describe_city("manila")
describe_city("saigon", "singapore")
describe_city("new york", "the united states")
