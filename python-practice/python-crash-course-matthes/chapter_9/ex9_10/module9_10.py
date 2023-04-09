"""Print description of restaurant"""

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

