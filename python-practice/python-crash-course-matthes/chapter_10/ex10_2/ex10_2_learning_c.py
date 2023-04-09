# Read from learning_python.txt
# Replace each occurrence of "Python" with "C"
# Print each modified line

import pathlib

path = pathlib.Path("learning_python.txt")
contents = path.read_text()

lines = contents.splitlines(keepends = True)
converted = ""

for line in lines:
    converted += line.replace("Python", "C")

print(converted)
