# Have all tests evaluate to true and false

# Test for equality and inequality with strings
string1 = "mark"
string2 = "royce"

print("Is string1 equal to string2?")
print(string1 == string2)
print("Is string1 not equal to string2?")
print(string1 != string2)

# Test if lowercase
print("Is string1 pure lowercase?")
print(string1 == string1.lower())
print("Does string1 have any uppercase characters?")
print(string1 != string1.lower())

# Numerical tests
num1 = 1
num2 = 2

print("\nIs num1 equal to num2?")
print(num1 == num2)
print("Is num1 not equal to num2?")
print(num1 != num2)
print("Is num1 greater than num2?")
print(num1 > num2)
print("Is num1 less than num2?")
print(num1 < num2)

# Tests with the keywords and, or
num3 = 3
num4 = 4
num5 = 5

print("\nIs num3 equal to num4 and is num4 equal to num5?")
print( (num3 == num4) and (num4 == num5) )
print("Is num3 equal to num4 or is num4 equal to num5?")
print( (num3 == num4) or (num4 == num5) )

# Test if in list and not in list
numbers = [6, 7, 8, 9]

print("\nIs 3 in the list?")
print(3 in numbers)
print("Is 8 in the list?")
print(8 in numbers)
print("Is 9 not in the list?")
print(9 not in numbers)

print("\nThat was a lot of tests!")
