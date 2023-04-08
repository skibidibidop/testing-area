# city_country(city, country)
# return "City Name, Country Name"
# call 3x, print returned values

def city_country(c_city, c_country):
    """"
    Return formatted combination of city and
    country
    """
    pair = f"{c_city.title()}, {c_country.title()}"
    return pair

counter = 0

while counter < 3:
    m_city = input("City: ")
    m_country = input("Country: ")
    print(city_country(m_city, m_country))
    counter += 1
