# Prompt for two numbers
# Convert input to int
# If input is not number, handle ValueError

while True:
    proceed = input("Proceed? y/n: ")
    if proceed == "n":
        break

    try:
        num1 = int(input("First number: "))
        num2 = int(input("Second number: "))
    except ValueError:
        print("Please enter a number.")
    else:
        sum = num1 + num2
        print(f"Sum: {sum}")
