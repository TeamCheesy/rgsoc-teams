
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
    url: FFaker::Internet.http_url
    #,
    #activated: true,
    #activated_at: Time.zone.now
    )
end




# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
