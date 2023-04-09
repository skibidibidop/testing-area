# Take class Restaurant from 9-4
# Write class IceCreamStand
#   Inherits from Restaurant
# Add attribute flavors
#   list of ice cream flavors
#  Write method to display flavors
# Make instance of IceCreamStand
# Call method to display flavors

class Restaurant:
    """Model of restaurant w/ name, cuisine
    Print description, print if open
    Child: IceCreamStand
    """

    def __init__(self, restaurant_name, cuisine_type):
        """Assign restaurant name & cuisine type"""
        self.restaurant_name = restaurant_name
        self.cuisine_type = cuisine_type
        self.number_served = 0

    def describe_restaurant(self):
        """Print restaurant name and describe cuisine
        served
        """
        print(f"{self.restaurant_name.title()} serves"
              f" {self.cuisine_type.title()} food.")
                
    def open_restaurant(self):
        """Print if restaurant is open"""
        print(f"{self.restaurant_name.title()} is open!")

    def set_number_served(self, served):
        """Assign new number of guests served"""
        self.number_served = served
    
    def increment_number_served(self, increment):
        """Increase number served by increment provided"""
        self.number_served += increment

class IceCreamStand(Restaurant):
    """Describe ice cream flavors"""
    def __init__(self, restaurant_name, cuisine_type):
        """Provide list of flavors"""
        super().__init__(restaurant_name, cuisine_type)
        self.flavors = ["chocolate", "vanilla", "strawberry"]

    def display_flavors(self):
        """Display all flavors in List"""
        print("Here are the flavors:")

        for flavor in self.flavors:
            print(f"{flavor.title()}")

# Main
stand1 = IceCreamStand("gelato stand", "italian")

stand1.describe_restaurant()
stand1.open_restaurant()
stand1.display_flavors()
