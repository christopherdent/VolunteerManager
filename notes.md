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
*****today i made it so you can select a volunteer from a list when creating, although you still need to associate it with the group.  
-Make it so you can add a group when creating a volunteer. (from existing groups)
*****do same as above
-get a group/:id/volunteers route up and running
-get a volunteer/;id/groups route up and running


STILL TRYING TO ADD GROUP WITH VOLuNTEER.  STUCK ON ATTRIBUTE METHOD IN THE VOLUNTEER MODEL - THE GROUP ISNT COMING THROUGH WITH PARAMS!!!
Notes from Saturday:-

Need to implement ability to add chair with group, just like you did with volunteer.


-Add volunteer to group should select from a list of existing volunteers??
create ACTION for a VOLuNTEER in a GROUP - what is the URL / HTTP Method for that?
