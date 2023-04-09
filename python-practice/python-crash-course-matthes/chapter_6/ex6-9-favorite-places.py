fav_places = {
        'person1' : ['place 1-1', 'place 1-2', 'place 1-3'],
        'person2' : ['place 2-1', 'place 2-2', 'place 2-3'],
        'person3' : ['place 3-1', 'place 3-2', 'place 3-3'],
        }

print("Your favorite places:")
for fp_person, fp_places in fav_places.items():
    print(f"\n{fp_person.title()}'s favorite places:")

    for place in fp_places:
        print(f"{place.title()}")
