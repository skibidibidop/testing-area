# Take code from 9-3
# Add attribute login_attempts
# Add method increment_login_attempts()
#   Increment login_attempts by 1
# Add method reset_login_attempts()
#   Reset login_attempts to 0
# Make instance, call increment_login_attempts()
#   multiple times
# Print login_attempts()
# Call reset_login_attempts()
# Print login_attempts() to check if reset

class Users:
    """Has name and age, prints description
    using attributes, prints personalized
    greeting
    """
    def __init__(self, name, age):
        """Contains attributes name and age"""
        self.name = name
        self.age = age
        self.login_attempts = 0
    
    def describe_user(self):
        """Print summary using attributes"""
        print(f"{self.name.title()} is {self.age}"
            " years old")
    
    def greet_user(self):
        """Print personalized greeting"""
        print(f"Hello, {self.name.title()}!")
    
    def increment_login_attempts(self):
        """+1 per login attempt"""
        self.login_attempts += 1

    def reset_login_attempts(self):
        """Reset login attempts"""
        self.login_attempts = 0

user1 = Users("mark", 29)

user1.describe_user()
user1.greet_user()
user1.increment_login_attempts()
print(f"{user1.name.title()}'s login attempts:"
      f" {user1.login_attempts}")

user1.greet_user()
user1.increment_login_attempts()
print(f"{user1.name.title()}'s login attempts:"
      f" {user1.login_attempts}")

print(f"Resetting {user1.name.title()}'s login attempts.")
user1.reset_login_attempts()

print(f"{user1.name.title()}'s login attempts:"
      f" {user1.login_attempts}")
