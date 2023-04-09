# Create a dictionary of info about each city
d_cities = {
        'city 1' : {
            'info 1' : 'info 1 about City 1 here',
            'info 2' : 'info 2 about City 1 here',
            'info 3' : 'info 3 about City 1 here',
            },

        'city 2' : {
            'info 1' : 'info 1 about City 2 here',
            'info 2' : 'info 2 about City 2 here',
            'info 3' : 'info 3 about City 2 here',
            },

        'city 3' : {
            'info 1' : 'info 1 about City 3 here',
            'info 2' : 'info 2 about City 3 here',
            'info 3' : 'info 3 about City 3 here',
            },
        }

# Print each city's name and info
for d_city, d_info in d_cities.items():
    print(f"\nCity name: {d_city.title()}")

    for info_key, info_value in d_info.items():
        print(f"{info_key.title()}: {info_value}")
