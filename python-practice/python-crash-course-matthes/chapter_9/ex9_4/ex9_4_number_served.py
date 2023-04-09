# Take code from 9-1
# Add attribute number_served = 0
# Print number served, then change value
#   and print again
# Add method set_number_served() to modify
#   number_served
# Add method increment_number_served() to
#   increment number served
# Call both methods

class Restaurant:
    """Model of restaurant w/ name, cuisine
    Print description, print if open
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

restaurant = Restaurant("buffalo's wings n' things",
                        "american")

print(f"Restaurant name: {restaurant.restaurant_name.title()}")
print(f"Cuisine: {restaurant.cuisine_type.title()}")

restaurant.describe_restaurant()
restaurant.open_restaurant()

print(f"Served guests: {restaurant.number_served}")

restaurant.number_served = 30
print(f"Served guests: {restaurant.number_served}")

restaurant.set_number_served(50)
print(f"Served guests: {restaurant.number_served}")

restaurant.increment_number_served(30)
print(f"Served guests: {restaurant.number_served}")
