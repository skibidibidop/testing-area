friend1 = {
        'friend' : 'cat',
        'hooman' : 'mark',
        }

friend2 = {
        'friend' : 'dog',
        'hooman' : 'royce',
        }

friend3 = {
        'friend' : 'lizard',
        'hooman' : 'person1',
        }

companions = [friend1, friend2, friend3]

for companion in companions:
    print("\nFriends:")
    for c_key, c_val in companion.items():
        print(f"{c_key.title()} -> {c_val.title()}")
