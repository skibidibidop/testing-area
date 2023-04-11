import employee

def test_give_default_raise():
    """Raise annual salary by default value 5000"""
    employee1 = employee.Employee("John", "Wick",
                                  100000)
    employee1.give_raise()

    assert employee1.annual_salary == 105000

