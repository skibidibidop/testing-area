glossary = {
        'variables' : '"Labels" for values stored in memory',
        'strings' : 'A series of characters',
        'floats' : 'Any number with a decimal point',
        'slice' : 'A specific part of a list',
        'immutable' : 'Cannot be modified',
        }

for g_key, g_value in glossary.items():
    print(f"{g_key.title()}:\n\t{g_value}.\n")
