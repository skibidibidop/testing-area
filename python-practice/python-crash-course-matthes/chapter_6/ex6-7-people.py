person1 = {
        'first_name' : 'First1',
        'last_name' : 'Last1',
        'age' : 24,
        'city' : 'Night City',
        }

person2 = {
        'first_name' : 'First2',
        'last_name' : 'Last2',
        'age' : 24,
        'city' : 'Night City',
        }

person3 = {
        'first_name' : 'First3',
        'last_name' : 'Last3',
        'age' : 24,
        'city' : 'Night City',
        }

people = [person1, person2, person3]

for person in people:
    print(f"\nDetails of {person['first_name']} "
          f"{person['last_name']}:")

    for p_key, p_val in person.items():
        print(f"\n{p_key} : {p_val}")
