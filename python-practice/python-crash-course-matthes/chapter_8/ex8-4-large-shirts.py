# make_shirt(size="Large", text="I Love Python")
# Make large and medium shirt with default message
# Make any size with different message

def make_shirt(size="Large", text="I Love Python"):
    """
    Take size of shirt and statement to print
    Print summary of details
    """
    print(f"Size: {size}, Statement: {text}")

make_shirt()
make_shirt("Medium")
make_shirt("Small", "I Love C")
