# Prompt user for name
# Write input to guest.txt

import pathlib

path = pathlib.Path("guest.txt")

contents = input("Please enter your name: ")
path.write_text(contents)
