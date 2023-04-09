"""
Print admin privileges
Not child or parent class
"""

class Privileges:
    """Contains privileges"""
    def __init__(self):
        """Contains privileges"""
        self.privileges = [
                            "can 1",
                            "can 2",
                            "can 3",
        ]

    def show_privileges(self):
        """Print list of admin privileges"""
        print("Admin privileges:")
        for privilege in self.privileges:
            print(f"{privilege}")

