# Prompt user for favorite number
# Use json.dumps() to store number in file
# Write separate program that reads this number
# and prints "Your favorite number is <input>"

import pathlib
import json

path = pathlib.Path("fav_num.json")

try:
    fav_num = int(input("What's your favorite number? "))
except ValueError:
    print("Please provide a number.")
else:
    content_dump = json.dumps(fav_num)
    path.write_text(content_dump)

try:
    content_load = path.read_text()
except FileNotFoundError:
    print("File not found.")
else:
    fav_num_load = json.loads(content_load)
    print(f"Your favorite number is {fav_num_load}")

