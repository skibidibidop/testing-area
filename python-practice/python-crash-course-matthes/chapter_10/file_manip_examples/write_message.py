import pathlib

contents = "I love programming.\n"
contents += "I love creating new games.\n"
contents += "I also love working with data.\n"

path = pathlib.Path("programming.txt")
path.write_text(contents)
