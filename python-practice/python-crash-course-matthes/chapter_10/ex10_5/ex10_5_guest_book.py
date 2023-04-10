# While loop, prompt user for names
# Write input to guest_book.txt
# Each input should appear on a new line

import pathlib

path = pathlib.Path("guest_book.txt")

contents = ""
while True:
    proceed = input("Input name? y/n: ")
    if proceed == 'n':
        break

    contents += input("Guest name: ") + "\n"

path.write_text(contents)
