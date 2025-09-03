# USERS
User.create!(
  username: "cdent",
  first_name: "Christopher",
  last_name: "Dent",
  email: "christopher.dent@example.gov",
  password: "password123",
  admin: true
)
User.create!(
  username: "guest",
  first_name: "guest",
  last_name: "user",
  email: "christopher.dent@example.com",
  password: "guest",
  admin: true
)
User.create!(
  username: "alane",
  first_name: "Alice",
  last_name: "Lane",
  email: "alice.lane@acmecorp.com",
  password: "password123",
  admin: false
)
User.create!(
  username: "jpark",
  first_name: "James",
  last_name: "Park",
  email: "james.park@acmecorp.com",
  password: "password123",
  admin: false
)


# VOLUNTEERS
Volunteer.create!(
  first_name: "Elizabeth",
  last_name: "Johnson",
  email: "elizabeth.johnson@email.com",
  organization: "Red Cross",
  sector: "Nonprofit",
  active_status: true,
  user_id: 2
)
Volunteer.create!(
  first_name: "Michael",
  last_name: "Anderson",
  email: "michael.anderson@email.com",
  organization: "Acme Corp",
  sector: "Industry",
  active_status: true,
  user_id: 3
)
Volunteer.create!(
  first_name: "Priya",
  last_name: "Sharma",
  email: "priya.sharma@email.com",
  organization: "Global Health Initiative",
  sector: "Nonprofit",
  active_status: true,
  user_id: 4
)
Volunteer.create!(
  first_name: "Carlos",
  last_name: "Martinez",
  email: "carlos.martinez@email.com",
  organization: "City Council",
  sector: "Government",
  active_status: true,
  user_id: 5
)
Volunteer.create!(
  first_name: "Grace",
  last_name: "Kim",
  email: "grace.kim@email.com",
  organization: "Innovatech",
  sector: "Industry",
  active_status: true,
  user_id: 2
)

# GROUPS
Group.create!(
  name: "Community Outreach",
  program_name: "Volunteer Engagement",
  chair_first: "Alice",
  chair_last: "Lane",
  status: true,
  user_id: 2,
  kind: "Program"
)
Group.create!(
  name: "Healthcare Initiatives",
  program_name: "Global Health Initiative",
  chair_first: "Maria",
  chair_last: "Roberts",
  status: true,
  user_id: 4,
  kind: "Working Group"
)
Group.create!(
  name: "Tech For Good",
  program_name: "Innovation",
  chair_first: "Sophia",
  chair_last: "Liu",
  status: true,
  user_id: 5,
  kind: "Working Group"
)
Group.create!(
  name: "Civic Projects",
  program_name: "City Council",
  chair_first: "James",
  chair_last: "Park",
  status: false,
  user_id: 3,
  kind: "Community"
)

# GROUP VOLUNTEERS (Statements of Expertise)
GroupVolunteer.create!(
  group_id: 1,
  volunteer_id: 1,
  statement: "Specialized in organizing large-scale fundraising events and community awareness campaigns."
)
GroupVolunteer.create!(
  group_id: 2,
  volunteer_id: 3,
  statement: "Expertise in global health research, policy analysis, and program management."
)
GroupVolunteer.create!(
  group_id: 3,
  volunteer_id: 5,
  statement: "Experienced with technology outreach programs for underrepresented communities."
)
GroupVolunteer.create!(
  group_id: 4,
  volunteer_id: 4,
  statement: "Focused on civic engagement, urban planning, and local government advocacy."
)
GroupVolunteer.create!(
  group_id: 1,
  volunteer_id: 2,
  statement: "Professional background in nonprofit operations and volunteer management."
)

