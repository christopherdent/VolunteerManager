# db/seeds.rb
ActiveRecord::Base.transaction do
  # Clear in FK-safe order
  GroupVolunteer.delete_all
  Group.delete_all
  Volunteer.delete_all
  User.delete_all

  # --- USERS ---
  users = {}
  users[:cdent] = User.create!(
    username: "cdent", first_name: "Christopher", last_name: "Dent",
    email: "christopher.dent@example.gov", password: "password123", admin: true
  )
  users[:guest] = User.create!(
    username: "guest", first_name: "guest", last_name: "user",
    email: "christopher.dent@example.com", password: "guest", admin: true
  )
  users[:alane] = User.create!(
    username: "alane", first_name: "Alice", last_name: "Lane",
    email: "alice.lane@acmecorp.com", password: "password123", admin: false
  )
  users[:jpark] = User.create!(
    username: "jpark", first_name: "James", last_name: "Park",
    email: "james.park@acmecorp.com", password: "password123", admin: false
  )

  # --- VOLUNTEERS ---
  volunteers = {}
  volunteers[:elizabeth_johnson] = Volunteer.create!(
    first_name: "Elizabeth", last_name: "Johnson", email: "elizabeth.johnson@email.com",
    organization: "Red Cross", sector: "Nonprofit", active_status: true,
    user: users[:guest]
  )
  volunteers[:michael_anderson] = Volunteer.create!(
    first_name: "Michael", last_name: "Anderson", email: "michael.anderson@email.com",
    organization: "Acme Corp", sector: "Industry", active_status: true,
    user: users[:alane]
  )
  volunteers[:priya_sharma] = Volunteer.create!(
    first_name: "Priya", last_name: "Sharma", email: "priya.sharma@email.com",
    organization: "Global Health Initiative", sector: "Nonprofit", active_status: true,
    user: users[:jpark]
  )
  volunteers[:carlos_martinez] = Volunteer.create!(
    first_name: "Carlos", last_name: "Martinez", email: "carlos.martinez@email.com",
    organization: "City Council", sector: "Government", active_status: true,
    user: users[:cdent]
  )
  volunteers[:grace_kim] = Volunteer.create!(
    first_name: "Grace", last_name: "Kim", email: "grace.kim@email.com",
    organization: "Innovatech", sector: "Industry", active_status: true,
    user: users[:guest]
  )

  # --- GROUPS ---
  groups = {}
  groups[:community_outreach] = Group.create!(
    name: "Community Outreach", program_name: "Volunteer Engagement",
    chair_first: "Alice", chair_last: "Lane", status: true,
    user: users[:guest], kind: "Program"
  )
  groups[:healthcare_initiatives] = Group.create!(
    name: "Healthcare Initiatives", program_name: "Global Health Initiative",
    chair_first: "Maria", chair_last: "Roberts", status: true,
    user: users[:jpark], kind: "Working Group"
  )
  groups[:tech_for_good] = Group.create!(
    name: "Tech For Good", program_name: "Innovation",
    chair_first: "Sophia", chair_last: "Liu", status: true,
    user: users[:cdent], kind: "Working Group"
  )
  groups[:civic_projects] = Group.create!(
    name: "Civic Projects", program_name: "City Council",
    chair_first: "James", chair_last: "Park", status: false,
    user: users[:alane], kind: "Community"
  )

  # --- GROUP VOLUNTEERS (Statements of Expertise) ---
  GroupVolunteer.create!(
    group: groups[:community_outreach],
    volunteer: volunteers[:elizabeth_johnson],
    statement: "Specialized in organizing large-scale fundraising events and community awareness campaigns."
  )
  GroupVolunteer.create!(
    group: groups[:healthcare_initiatives],
    volunteer: volunteers[:priya_sharma],
    statement: "Expertise in global health research, policy analysis, and program management."
  )
  GroupVolunteer.create!(
    group: groups[:tech_for_good],
    volunteer: volunteers[:grace_kim],
    statement: "Experienced with technology outreach programs for underrepresented communities."
  )
  GroupVolunteer.create!(
    group: groups[:civic_projects],
    volunteer: volunteers[:carlos_martinez],
    statement: "Focused on civic engagement, urban planning, and local government advocacy."
  )
  GroupVolunteer.create!(
    group: groups[:community_outreach],
    volunteer: volunteers[:michael_anderson],
    statement: "Professional background in nonprofit operations and volunteer management."
  )
end

puts "Seeded users(4), volunteers(5), groups(4), memberships(5)"
