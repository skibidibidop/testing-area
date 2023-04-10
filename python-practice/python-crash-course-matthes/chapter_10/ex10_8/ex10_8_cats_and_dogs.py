# Make cats.txt and dogs.txt
# Store 3 names in each file
# Read both files and print to terminal
# Add try-except for FileNotFoundError
# Add message for missing file
# Test try-except by moving one txt file
# to another dir

import pathlib

file_names = ["cats.txt", "dogs.txt"]

for file in file_names:
    path = pathlib.Path(file)
    try:
        contents = path.read_text()
    except FileNotFoundError:
        # print(f"{file} can't be found.")
        pass
    else:
        print(contents)
