import pytest
import employee

@pytest.fixture
def employee_details():
    """Employee details made available to all
    methods"""
    employee1 = employee.Employee("John", "Wick",
                                  100000)
    return employee1

def test_give_default_raise():
    """Raise annual salary by default value 5000"""
    employee1.give_raise()

    assert employee1.annual_salary == 105000

def test_give_custom_raise():
    """Raise annual salary by custom amount"""
    employee1.give_raise(100000)

    assert employee1.annual_salary == 200000

