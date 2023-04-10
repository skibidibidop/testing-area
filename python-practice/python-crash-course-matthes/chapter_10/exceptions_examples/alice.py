import pathlib

path = pathlib.Path("alice.txt")
try:
    contents = path.read_text(encoding="utf-8")
except FileNotFoundError:
    print(f"The file {path} does not exist.")
