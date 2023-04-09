"""
Print admin priveleges
Parent: Users
"""

import module_user

class Admin(module_user.Users):
    """List admin privileges"""
    def __init__(self, name, age):
        """Initialize attributes of parent class"""
        super().__init__(name, age)
        self.privileges = [
                            "can add/remove post",
                            "can add/remove users",
                            "can ban users"
        ]

