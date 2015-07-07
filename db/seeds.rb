# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Temp commented out: seeds from upstream repo
  # role = Role.create!([{name: 'organizer'}])
  # user = User.create!([{name: 'Wolverine', roles: role, github_handle: 'Adminis28'}])


4.times do
   title = FFaker::Job.title
   company_name = FFaker::Company.name
   contact_name = FFaker::Name.name
   description = FFaker::HipsterIpsum.phrase
   duration = "#{Random.new.rand(3..24)} months"  #type is string or like this: "#{[3,6,12,24].sample} months"
   location = FFaker::Address.country             #type is string
   misc_info = FFaker::Company.bs                 #type is string
   paid = FFaker::Boolean.random                  #type is bool
   url = FFaker::Internet.http_url                #url is string
   activated = true
   activated_at = Time.zone.now

  JobOffer.create!(title: title,
     company_name: company_name,
     contact_name: contact_name,
     description: description,
     duration: duration,
     location: location,
     misc_info: misc_info,
     paid: true,
     url: url,
     activated: true,
     activated_at: Time.zone.now)
 end

# TEMP comments, during development (and coaching)
# One extra, to check if non activated offer will not show up on page
# TODO : Before I uncomment this, I want to know if seeding works; if so,
# I will if test if the local vars can live outside the method
# and then add the NonActivated JobOffer

# JobOffer.create!(title: "NonActivated JobOffer",
#      company_name: company_name,
#      contact_name: contact_name,
#      description: description,
#      duration: duration,
#      location: location,
#      misc_info: misc_info,
#      paid: true,
#      url: url,
#      activated: false,
#      activated_at: Time.zone.now)

