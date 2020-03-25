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
-Note here i fixed my strong params problem.  I just had to define user id and allow it, it had to be a hidden field.  

NEXT SPRINT:-

-Make it so you can add a volunteer (Chair) when creating a group OR select from the list
-Make it so you can add a group when creating a volunteer.  
-get a group/:id/volunteers route up and running
-get a volunteer/;id/groups route up and running
