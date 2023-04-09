import pathlib

path = pathlib.Path("pi_digits.txt")
contents = path.read_text()
print(contents)
