# If age is < 3, ticket is free
# If age is 3 to 12, ticket is $10
# If age is > 12, ticket is $15
# Loop, ask for age and print price of ticket
# Terminate if input is quit

print("To check the ticket price, please provide your age. Type 0 to exit.")

while True:
    age = input("How old are you? ")
    age = int(age)

    if age == 0:
        break

    if age < 3:
        print("Your ticket is free.")
    elif (age >= 3) and (age <= 12):
        print("Please pay $10.")
    elif age > 12:
        print("Please pay $15.")
