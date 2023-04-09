# Take parent class Users from 9-5
# Write child class Admin (parent Users)
# Add attribute privileges (List)
#   has "can add/delete post", "can add/delete
#       user"
# Add method show_privileges()
#   Print list of Admin privileges
# Create instance of Admin
# Call show_privileges()

class Users:
    """Has name and age, prints description
    using attributes, prints personalized
    greeting
    Child: Admin
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

class Admin(Users):
    """List admin privileges"""
    def __init__(self, name, age):
        """Initialize attributes of parent class"""
        super().__init__(name, age)
        self.privileges = [
                            "can add/remove post",
                            "can add/remove users",
                            "can ban users"]

    def show_privileges(self):
        """Print list of admin privileges"""
        print("Admin privileges:")

        for privilege in self.privileges:
            print(f"{privilege}")

admin = Admin("mark", "29")
admin.show_privileges()
