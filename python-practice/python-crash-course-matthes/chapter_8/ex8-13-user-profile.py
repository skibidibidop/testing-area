# copy user_profile.py
# write build_profile()
# build profile by using first and last name,
# and 3 other key-value pairs about me

def build_profile(first, last, **user_info):
    """
    Build a dictionary containing info about
    the user
    """
    user_info["first_name"] = first
    user_info["last_name"] = last

    return user_info

user_profile = build_profile("Mark", "Beltran",
                             info1="info1",
                             info2="info2")

print(user_profile)
