# Make List sandwich_orders with names of sandwiches
# Make empty list finished sandwiches
# Process each in sandwich_orders and print
# "Made <sandwich> sandwich."
# Move processed sandwich to finished_sandwiches
# Print list of all finished sandwiches

sandwich_orders = [
        "sandwich 1", "sandwich 2",
        "sandwich 3", "sandwich 4"]

finished_sandwiches = []
counter = 0

while counter < 4:
    made = sandwich_orders.pop(0)
    print(f"Made {made} .")
    finished_sandwiches.append(made)
    counter += 1

print(f"Finished: {finished_sandwiches}")
print(f"Pending: {sandwich_orders}")
