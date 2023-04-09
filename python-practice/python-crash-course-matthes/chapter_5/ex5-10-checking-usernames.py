current_users = ["user1", "user2", "user3", "user4", "user5"]

new_users = ["user1", "User2", "nuser3", "nuser4", "nuser5"]

for new_user in new_users:
    if new_user.lower() in current_users:
        print(f"Please pick a new username, {new_user}.")
    else:
        print(f"Welcome, {new_user}.")
