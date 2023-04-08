# function should store info about car in dictionary
# positional args: manufacturer, model
# arbitrary arg after
# print dictionary to check if correct

def get_car_info(manufacturer, model, **car_info):
    """
    Store manufacturer, model, and arbitrary info
    in dictionary. Print contents of dictionary.
    """
    car_info["manufacturer"] = manufacturer
    car_info["model"] = model

    return car_info

car1 = get_car_info("Toyota", "Vios",
                    info1="1", info2="2")

car2 = get_car_info("Honda", "Accord",
                    info1="1", info2="2")

print(car1)
print(car2)
