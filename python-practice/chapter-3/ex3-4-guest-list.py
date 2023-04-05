names = ['Person1', 'Person2', 'Person3']

print(f"Guests: {len(names)}")
print(f"Would you like to go to dinner, {names[0]}?")
print(f"Would you like to go to dinner, {names[1]}?")
print(f"Would you like to go to dinner, {names[2]}?\n")

print(f"{names[2]} can't make it, unfortunately.\n")

del names[2]
names.append("Person4")

print(f"Guests: {len(names)}")
print(f"Would you like to go to dinner, {names[0]}?")
print(f"Would you like to go to dinner, {names[1]}?")
print(f"Would you like to go to dinner, {names[2]}?\n")

print("Dear guests, a bigger table has been found!\n")

names.insert(0, "Person5")
names.insert(1, "Person6")
names.append("Person7")

print(f"Guests: {len(names)}")
print(f"Would you like to go to dinner, {names[0]}?")
print(f"Would you like to go to dinner, {names[1]}?")
print(f"Would you like to go to dinner, {names[2]}?")
print(f"Would you like to go to dinner, {names[3]}?")
print(f"Would you like to go to dinner, {names[4]}?")
print(f"Would you like to go to dinner, {names[5]}?\n")

print(f"Dear guests, my apologies. The bigger table won't arrive in time for our dinner.\n")

removed = names.pop()
print(f"{removed}, my apologies but we won't be able to accommodate you.")
removed = names.pop()
print(f"{removed}, my apologies but we won't be able to accommodate you.")
removed = names.pop()
print(f"{removed}, my apologies but we won't be able to accommodate you.")
removed = names.pop()
print(f"{removed}, my apologies but we won't be able to accommodate you.\n")

print(f"Guests: {len(names)}")
print(f"{names[0]}, you are still invited to dinner.")
print(f"{names[1]}, you are still invited to dinner.")

del names[1]
del names[0]

print(names)
print(f"Guests: {len(names)}")
