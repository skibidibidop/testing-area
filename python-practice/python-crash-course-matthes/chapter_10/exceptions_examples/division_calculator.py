print("Give two numbers for division.")
print("'q' to quit")

while True:
    first_num = input("\nFirst number: ")
    if first_num == "q":
        break

    second_num = input("Second number: ")
    if second_num == "q":
        break

    try:
        answer = int(first_num) / int(second_num)
    except ZeroDivisionError:
        print("\nYou can't divide by zero :)")
    else:
        print(answer)
