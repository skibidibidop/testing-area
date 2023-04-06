rivers = {
        'nile' : 'egypt',
        'pasig' : 'the philippines',
        'river1' : 'country1',
        }

for r_key, r_var in rivers.items():
    print(f"The {r_key.title()} river runs through {r_var.title()}.")

print("\nRivers mentioned:")
for r_key in rivers.keys():
    print(r_key.title())

print("\nCountries:")
for r_value in set(rivers.values()):
    print(r_value.title())
