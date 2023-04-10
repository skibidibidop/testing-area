# Read dracula.txt
# Use count(<string to check>) to count <string to check>
# Convert all to lowercase to catch all occurrences
# Print number of matches with "the" and "the "

import pathlib

path = pathlib.Path("dracula.txt")
contents = path.read_text()

the = contents.lower().count("the")
the_ = contents.lower().count("the ")

print(f"'The': {the}")
print(f"'The ': {the_}")
