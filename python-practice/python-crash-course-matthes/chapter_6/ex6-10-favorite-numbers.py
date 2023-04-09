# Create data structure which contains
# Person with multiple favorite numbers

fav_numbers = {
        'person1' : [1, 2, 3, 4],
        'person2' : [5, 6, 7, 8],
        'person3' : [9, 10, 11, 12],
        'person4' : [13, 14, 15, 16],
        'person5' : [17, 18, 19, 20],
        }

print("Your favorite numbers!")

for fn_key, fn_val in fav_numbers.items():
    print(f"\n{fn_key.title()}'s favorite numbers:")

    for number in fn_val:
        print(number)
