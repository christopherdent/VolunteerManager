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
User.create!(
  username: "mroberts",
  first_name: "Maria",
  last_name: "Roberts",
  email: "maria.roberts@globaltech.com",
  password: "password123",
  admin: false
)
User.create!(
  username: "sliu",
  first_name: "Sophia",
  last_name: "Liu",
  email: "sophia.liu@innovatech.com",
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

require 'faker'

# === USERS ===
10.times do
  User.create!(
    username: Faker::Internet.unique.username,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    password: "password123",
    admin: [true, false].sample
  )
end

# === VOLUNTEERS ===
20.times do
  Volunteer.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    organization: Faker::Company.name,
    sector: %w[Nonprofit Industry Government Education Healthcare].sample,
    active_status: [true, false].sample,
    user_id: User.pluck(:id).sample
  )
end

# === GROUPS ===
10.times do
  Group.create!(
    name: Faker::Company.industry,
    program_name: Faker::Company.catch_phrase,
    chair_first: Faker::Name.first_name,
    chair_last: Faker::Name.last_name,
    status: [true, false].sample,
    user_id: User.pluck(:id).sample,
    kind: %w[Program Working\ Group Community].sample
  )
end

# === GROUP VOLUNTEERS (Statements of Expertise) ===
30.times do
  GroupVolunteer.create!(
    group_id: Group.pluck(:id).sample,
    volunteer_id: Volunteer.pluck(:id).sample,
    statement: Faker::Lorem.sentence(word_count: 12)
  )
end
