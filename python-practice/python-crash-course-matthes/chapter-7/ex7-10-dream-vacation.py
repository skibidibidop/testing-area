# Ask users for dream vacation spot
# Print results

places = []

while True:
    place = input("Best vacation spot: ")
    places.append(place)
    next_answer = input("Continue? y/n: ")

    if next_answer == "n":
        break

print("Places mentioned:")

for place2 in set(places):
    # Used place2 instead of place to avoid
    # duplicate variable name
    print(f"{place2.title()}")
