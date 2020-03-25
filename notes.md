Volunteer Manager


User Model
-Has many volunteers
-Has many groups, through volunteers
-Has many comments (maybe)

-Has a username, first_name, last_name, email, password digest

Volunteer Model
-has_many gruops
-Has many comments
belongs_to user
-Has a first_name, last_name, email, organization, sector

Group Model
-Has many volunteers
-Has a name, a program name, a leader, and and a status (active/inactive)


Comments
-Belongs to User
-Belongs to Volunteer
-Belongs to Group



--------------------
Volunteer Index Page
-Should be able to sort vols by last name
NEXT SPRINT:
-Test all volunteer functionality
-Implement all volunteer functionality to GROUP model
-Tet all group functionality
-Note here i fixed my strong params problem.  I just had to passs group_id to the link_to method in the create action.  I will do the same for volunteers to DRY this off.  
