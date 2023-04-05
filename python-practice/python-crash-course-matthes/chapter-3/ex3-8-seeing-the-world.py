locations = ["Loc3", "Loc1", "Loc4", "Loc5", "Loc2"]

print(f"Original list: {locations}")
print(f"Sorted alphabetically: {sorted(locations)}")

locations.reverse()
print(f"Reversed list: {locations}")
locations.reverse()
print(f"Unreversed list: {locations}")

locations.sort()
print(f"Alphabetical order: {locations}")
locations.sort(reverse=True)
print(f"Reverse alphabetical order: {locations}")
