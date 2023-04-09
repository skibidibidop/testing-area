"""Take name andage
Print summary of info
Print personalized greeting
Print login attempts
Reset login attempts
"""

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

