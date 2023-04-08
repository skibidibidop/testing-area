# Make class Users
# Attributes: name, age
# Method: describe_user()
#   Print summary of attributes
# Method: greet_user()
#   Print personalized message
# Create several instances, use
#   both methods for each

class Users:
    """Has name and age, prints description
    using attributes, prints personalized
    greeting
    """
    def __init__(self, name, age):
        """Contains attributes name and age"""
        self.name = name
        self.age = age
    
    def describe_user(self):
        """Print summary using attributes"""
        print(f"{self.name.title()} is {self.age}"
            " years old")
    
    def greet_user(self):
        """Print personalized greeting"""
        print(f"Hello, {self.name.title()}!")

user1 = Users("mark", 29)
user2 = Users("royce", 27)
user3 = Users("user three", 100)

user1.describe_user()
user1.greet_user()

user2.describe_user()
user2.greet_user()

user3.describe_user()
user3.greet_user()
