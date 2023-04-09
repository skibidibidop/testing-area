import module_user as mu
import module_privileges as mp
import module_admin as ma

user = mu.Users("user 1", "100")
admin1 = ma.Admin("mark", 29)
admin2 = mp.Privileges()

user.describe_user()
admin1.describe_user()
admin2.show_privileges()

