# Use class Restaurant from 9-1
# Create 3 different instances
# Call method describe_restaurant() for each

class Restaurant:
    """Model of restaurant w/ name, cuisine
    Print description, print if open
    """

    def __init__(self, restaurant_name, cuisine_type):
        """Assign restaurant name & cuisine type"""
        self.restaurant_name = restaurant_name
        self.cuisine_type = cuisine_type

    def describe_restaurant(self):
        """Print restaurant name and describe cuisine
        served
        """
        print(f"{self.restaurant_name.title()} serves"
              f" {self.cuisine_type.title()} food.")
                
    def open_restaurant(self):
        """Print if restaurant is open"""
        print(f"{self.restaurant_name.title()} is open!")

resto1 = Restaurant("mcdo", "american")
resto2 = Restaurant("amici", "italian")
resto3 = Restaurant("mang inasal", "filipino")

resto1.describe_restaurant()
resto2.describe_restaurant()
resto3.describe_restaurant()
