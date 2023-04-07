# Ask user for pizza toppings
# Print "<topping> will be added" for each input
# Loop back to 1st step
# Terminate if input is "quit"

print("Please select a topping. "
      "Write 'quit' to exit.")

status = True

while status:
    topping = input("\nTopping: ")

    if topping != 'quit':
        print(f"We'll add {topping.upper()}.")
    else:
        print("Thank you.")
        status = False
