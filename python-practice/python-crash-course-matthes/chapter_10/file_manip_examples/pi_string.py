import pathlib

path = pathlib.Path("pi_million_digits.txt")
contents = path.read_text()

lines = contents.splitlines()
pi_string = ""

for line in lines:
    pi_string += line.lstrip()
    # strip() will also work here

print(f"{pi_string[:52]}...")
print(len(pi_string))
