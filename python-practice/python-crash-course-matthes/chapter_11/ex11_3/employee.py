# Write class Employee
# __init__(self, first_name, last_name,
#           annual_salary)
# args above should be attributes
# Create method give_raise()
# Default $5,000, but can accept other values

class Employee:
    """Take first name, last name, and annual salary."""
    def __init__(self, first, last, annual_salary):
        """Initialize class with attributes First name,
        Last name, and Annual salary."""
        self.first_name = first
        self.last_name = last
        self.annual_salary = int(annual_salary)

    def give_raise(self, more_salary=5000):
        """Increases annual salary, 5000 by default but
        can accept other values."""
        self.annual_salary += int(more_salary)

