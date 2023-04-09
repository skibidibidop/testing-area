# Summarize learned info in learning_python.txt
# Read file, print twice
# 1st: by reading entire file
# 2nd: by storing lines in a list, then looping
# over each line

import pathlib

path = pathlib.Path("learning_python.txt")
contents = path.read_text()

# First read and print
print(contents)

# Second read and print
lines = contents.splitlines(keepends = True)
new_string = ""

for line in lines:
    new_string += line

print(new_string)
