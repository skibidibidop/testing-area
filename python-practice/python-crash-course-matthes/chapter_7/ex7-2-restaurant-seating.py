# Ask number of people in group
# If > 8, print "wait"
# Else, print "ready"

diner_count = input("How many people are there in your group? ")
diner_count = int(diner_count)

if diner_count > 8:
    print("Please wait...")
else:
    print("Your table is ready.")
