# Ask for number
# Report if multiple of 10 or not

number = input("Please provide a number: ")
number = int(number)

if number % 10 == 0:
    print("Your number is a multiple of ten.")
else:
    print("Your number is not a multiple of ten.")
