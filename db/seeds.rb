
# Temp commented out: seeds from upstream repo
  # role = Role.create!([{name: 'organizer'}])
  # user = User.create!([{name: 'Wolverine', roles: role, github_handle: 'Adminis28'}])


5.times do
  JobOffer.create!(title: FFaker::Job.title,
                   company_name: FFaker::Company.name,
                   contact_name: FFaker::Name.name,
                   contact_email: FFaker::Internet.safe_email,
                   description: FFaker::HipsterIpsum.paragraph,
                   duration: "#{[3,6,12,24].sample} months",
                   location: FFaker::Address.country,
                   misc_info: FFaker::Company.bs.capitalize,
                   paid: FFaker::Boolean.random,
                   url: FFaker::Internet.http_url )
end


10.times do
  fake_gh_id = (1..9).to_a.shuffle[0..4].join.to_i
  name = FFaker::Name.first_name
  fake_handle = "gh" << name.downcase

  user = User.create!(name: name, github_id: fake_gh_id, github_handle: fake_handle )
end

User.all.each do |u|
  #Note to self Here I call the constants roles from Role class, they are not in roles database
  #role = Role::TEAM_ROLES.sample
  role = %w[mentor student coach].sample
  u.roles.create!(name: role)
end

user = User.create(name: "Cheese", github_id: 12345, github_handle: "maudgh")
user.roles.create!(name: "organizer")
#user.roles.create!(name: "student")
user.roles.create!(name: "developer")
user.roles.create!(name: "coach")
user.roles.create!(name: "mentor")



# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
