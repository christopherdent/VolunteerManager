Volunteer Manager


Volunteer Model
-has_many gruops
-Has many comments
belongs_to user
-Has a first_name, last_name, email, organization, sector

Group Model
-Has many volunteers
-Has a name, a program name, a leader, and and a status (active/inactive)

VolunteerGroups
-belongs to Volunteer
-belongs to group

User Model
-Has many volunteers
-Has many groups, through volunteers
-Has many comments

-Has a username, first_name, last_name, email, password digest

Comments
-Belongs to User
-Belongs to Volunteer
-Belongs to Group
