# Make list/tuple (my_ticket), contains your lottery ticket
# Use loop to keep pulling lottery numbers
#   until match w/ my_ticket
# Print total loop count

import random

pool = [0, 1, 2, 3, 4, 5, 6, 7,
        8, 9, "a", "b", "c",
        "d", "e"]
draw = []
my_ticket = [1, 8, "a", "e"]

def pick(p_pool):
    """Pick 4 characters from pool at random"""
    p_counter = 0
    p_rand = 0
    p_draw = []
    while True:
        p_rand = random.choice(p_pool)
        if p_rand in p_draw:
            continue

        p_draw.append(p_rand)

        if p_counter == 3:
            break

        p_counter += 1
    return p_draw

# Main
try_count = 0
success_count = 0

while True:
    draw = pick(pool)
    try_count += 1
    print(f"Draw: {draw}")

    for character in draw:
        if character not in my_ticket:
            success_count = 0
            break
        
        success_count += 1
        
    if success_count == 4:
        print(f"Match! Attempts: {try_count}")
        break
