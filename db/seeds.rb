# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Temp commented out seeds from upstream repo
  # role = Role.create!([{name: 'organizer'}])
  # user = User.create!([{name: 'Wolverine', roles: role, github_handle: 'Adminis28'}])

require 'FFaker' #TODO: do I need this?

# JobOffer.create!( title: "Example Job Title",
#                   company_name: "Example Company",
#                   contact_name: "Example Name",
#                   description: "Interesting details",
#                   duration: "12 months",
#                   location: "US",
#                   misc_info: "tralala",
#                   paid: true,
#                   url: "http://www.google.com",
#                   activated: true,
#                   activated_at: Time.zone.now)

    4.times do
       title = FFaker::Job.title
       company_name = FFaker::Company.name
       contact_name = FFaker::Name.name
       description = FFaker::HipsterIpsum.phrase
       duration = "#{Random.new.rand(3..24)} months"  #type is string
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

