# Make class Restaurant
# __init()__ should have attributes:
#   restaurant_name and cuisine_type
# Methods:
#   describe_restaurant(): prints name and cuisine type
#   open_restaurant(): prints "We are open"
# Make instance of Restaurant called restaurant
#   print 2 attributes individually
#   call both methods

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

restaurant = Restaurant("buffalo's wings n' things",
                        "american")

print(f"Restaurant name: {restaurant.restaurant_name.title()}")
print(f"Cuisine: {restaurant.cuisine_type.title()}")

restaurant.describe_restaurant()
restaurant.open_restaurant()
