favorite_languages = {
        'jen' : 'python',
        'sarah' : 'c',
        'edward' : 'rust',
        'phil' : 'python',
        }

candidates = ['person1', 'person2', 'person3', 'edward']

for candidate in candidates:
    if candidate in favorite_languages.keys():
        print(f"Thank you for taking the poll, {candidate.title()}.")
    else:
        print(f"You are invited to take the poll, {candidate.title()}.")
