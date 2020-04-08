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


-Add a group with volunteer (done)

Need to implement ability to add chair with group, just like you did with volunteer. (done)


-Add group with volunteers currently chooses from list of vols but should have ability to create a new vol.  
create ACTION for a VOLuNTEER in a GROUP - what is the URL / HTTP Method for that?  or select from existing vols.
Volunteer index - filter by group (see nested resources lab )
-SCOPE method requirement - make an admin feature (namespaced routes lab).  Admin feature can show who has created what groups and volunteers (user's volunteers, user's groups)


4/2 Next Sprint:
-Remove from Group (Done)
-Filter Vol Index Page by group (done) AND add a search box for volunteers and groups (MAYBE)
-Incorporate statements of expertise via join table.  - See Displaying has Many Through Lab.  IF YOU CANT GET THIS TO WORK JUST DO COMMENTS FOR GROUP AND VOLS BY USER.  
-Add attrubute to Group - TYPE DONE
Following:
-Tighten up validations and authentication
-Build ADMIN Scope Method Feature (See namespaced routes lab - make CRUD all admin only)
Following:
-Explore possibility of having a CV attribute for Voluteers.  If possible, incorporate it with a gem.   
Following:
Look at pages for HTML consistency.  Add DIVs where needed and go to town with CSS.  
Last steps:  OMNIAUTH.  

4/6 Next Sprint:
-Reincorporate "Add to Group" feature from Volunteer Page.  
-TRY to stop adding a statement of expertise from associating with a group if they are already on that group (right now patched with .uniq)
-Build ADMIN Scope Methd feature (see namespaced routes lab - CRUD should be admin only)
-CSS
-Omniauth

Aspirational:
-CV attribute for volunteers
-Search Box
-JS function to show only the groups the volunteer is on on the new statement of expertise page (this would change a lot of things)
