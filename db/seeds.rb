# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Volunteer.create(first_name: "Calvin", last_name: "Coolidge", email: "huey@lewis.com", organization: "New Lab", sector: "Industry", active_status: true, user_id: 1)
Volunteer.create(first_name: "George", last_name: "Washington", email: "george@gwu.edu", organization: "George Washington University", sector: "Academia", active_status: true, user_id: 1)
Volunteer.create(first_name: "Abraham", last_name: "Lincoln", email: "honestabe@askjeeves.com", organization: "White House", sector: "Government", active_status: true, user_id: 1)
Volunteer.create(first_name: "Woodrow", last_name: "Wilson", email: "woodrow@dhs.gov", organization: "Homeland Security", sector: "Government", active_status: true, user_id: 1)
Volunteer.create(first_name: "Barack", last_name: "Obama", email: "obama@obama.com", organization: "Obama University", sector: "Academia", active_status: true, user_id: 1)
Volunteer.create(first_name: "Incredible", last_name: "Hulk", email: "hulk@smash.com", organization: "Avengers", sector: "Industry", active_status: true, user_id: 1)
Volunteer.create(first_name: "Iron", last_name: "Man", email: "tony@avengers.com", organization: "Avengers", sector: "Industry", active_status: true, user_id: 1)
Volunteer.create(first_name: "Black", last_name: "Widow", email: "bw@avengers.org", organization: "Avengers", sector: "Industry", active_status: true, user_id: 1)
Volunteer.create(first_name: "Spider", last_name: "Man", email: "spidey@nyc.com", organization: "Consultant", sector: "Industry", active_status: true, user_id: 1)
Volunteer.create(first_name: "Elvis", last_name: "Presley", email: "elvis@leftthebuilding.com", organization: "Rock", sector: "Industry", active_status: true, user_id: 1)
Volunteer.create(first_name: "Thor", last_name: "Odinson", email: "thor@smash.com", organization: "Avengers", sector: "Industry", active_status: true, user_id: 1)

Group.create(name: "Shrimp Working Group", program_name: "SPSFAM", chair_first: "", chair_last: "", status: true, user_id: 1, kind: "Working Group")
Group.create(name: "Anthrax Working Group", program_name: "SPADA", chair_first: "", chair_last: "", status: true, user_id: 1, kind: "Working Group")
Group.create(name: "Micro Working Group", program_name: "CASP", chair_first: "", chair_last: "", status: true, user_id: 1, kind: "Working Group")
Group.create(name: "Vaping Working Group", program_name: "CASP", chair_first: "", chair_last: "", status: true, user_id: 1, kind: "Working Group")
Group.create(name: "Plague Working Group", program_name: "SPADA", chair_first: "", chair_last: "", status: true, user_id: 1, kind: "Working Group")
Group.create(name: "Pesticide Sub-Group", program_name: "CASP", chair_first: "", chair_last: "", status: true, user_id: 1, kind: "WG Sub-Group")
Group.create(name: "Food Authenticity", program_name: "Food Authenticity", chair_first: "", chair_last: "", status: true, user_id: 1, kind: "Program")
Group.create(name: "CASP", program_name: "CASP", chair_first: "", chair_last: "", status: true, user_id: 1, kind: "Community")

User.create(username: "cjd", first_name: "christoper", last_name: "det", email: "christopherde01@gmail.com", password: "123")
User.create(username: "cjd1", first_name: "christopher", last_name: "dnt", email: "christopherden01@gmail.com", password: "123")
User.create(username: "cjd2", first_name: "cristopher", last_name: "dnt", email: "christopherent01@gmail.com", password: "123")
User.create(username: "cjd3", first_name: "chrisopher", last_name: "nt", email: "christophernt01@gmail.com", password: "123")
