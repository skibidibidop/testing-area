# sandwich(*items)
# print summary of sandwich
# call 3x, each with different number
# of arguments

def sandwich(*ingredients):
    """
    Take arbitrary number of ingredients
    Print summary of sandwich
    """
    print("Your sandwich will contain "
          "the following:")

    for ingredient in ingredients:
        print(f"{ingredient}")

sandwich("ingredient 1")
sandwich("ingred1", "ingred2", "ingred3")
sandwich("ingred1", "ingred2")
