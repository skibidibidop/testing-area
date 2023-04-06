usernames = ["admin", "royce", "mark"]

for username in usernames:
    if username == "admin":
        print(f"Hello, {username.title()}. Here's the status report.")
    else:
        print(f"Thank you for logging in, {username.title()}.")

print("\nRunning test without users.")
usernames = []

if usernames:
    print("Thank you for logging in, members.")
else:
    print("Users needed.")
