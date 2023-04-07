# Make list sandwich_orders with "pastrami"
# in the list thrice
# Print "The deli has run out of pastrami"
# While loop, remove all pastrami in sandwich_orders

finished_sandwiches = []
sandwich_orders = [
        "sandwich 1", "sandwich 2",
        "sandwich 3", "pastrami",
        "sandwich 4", "pastrami",
        "pastrami"]

print(f"Current orders: {sandwich_orders}.")
print("Oh no! The deli has run out of pastrami!")

counter = 0
limit = len(sandwich_orders)

while counter < limit:
    sandwich = sandwich_orders.pop(0)

    if sandwich == "pastrami":
        counter += 1
        continue

    print(f"Made {sandwich}.")
    finished_sandwiches.append(sandwich)
    counter += 1

print(f"Finished: {finished_sandwiches}")
print(f"Pending: {sandwich_orders}")
