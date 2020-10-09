# README:  Association Volunteer Manager (AVM)
AVM is a digital tool for keeping track of an association's technical volunteers and the various groups they belong to.  Volunteers can have many goups and groups can have many volunteers, which are linked by a Statement of Expertise unique to each group per volunteer.  The app allows  you to create, read/view, update, and delete volunteers, groups, and their statements, email any group with one click, and even store your volunteers' CVs.  It offers numerous ways to filter each of these categories in an effort to make it as easy as possible for the system user to obtain the data the need fast.  System users are meant to collaborate so objects are not necessarily  tied to individual users, but 'admin' status is required for most CRUD functionality.  Non admin users may also be created but are limited mostly to read only access.  

## Instructions for Use:  
Fork the [volunteer manager repo](https://github.com/christopherdent/VolunteerManager.git) and clone it down to your computer.  In your terminal, `cd` to the VolunteerManager folder.  Run `bundle install`. Run `rake db:migrate`.  If you'd like to add some test volunteers and groups, you may also run `rake db:seed`.

## Usage
To run the app locally, type `rails s` into the terminal and open your browser to `localhost:3000`.  Create a user, login and go.  Note:  By default, the first User created will be an admin.  

## Demo Video
Available <a href = "https://www.youtube.com/watch?v=v6ifLuecsmA&t=8s">here. </a>

Or see it live at https://voluteermanager.heroku.com/ (email christopherdent01@gmail.com for credentials)

## Built With

Built with Ruby 2.5.1p57 and Rails 6.0.2.1 and styled with Bootstrap 4.  
