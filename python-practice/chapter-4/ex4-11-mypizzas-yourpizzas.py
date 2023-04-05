my_pizzas = ["pepperoni", "margherita", "belly buster", "shrimp garlic"]
friend_pizzas = my_pizzas[:]

my_pizzas.append("neopolitan")
friend_pizzas.append("hawaiian")

print("My favorite pizzas:")
for my_pizza in my_pizzas:
    print(my_pizza)

print("My friend's favorite pizzas:")
for friend_pizza in friend_pizzas:
    print(friend_pizza)

print("All of the pizzas!")
