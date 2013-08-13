# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)



@password_attrs = {password: "password", password_confirmation: "password"}

puts 'Creating Admins'
admin = Spree::User.new @password_attrs.merge({email: "ilango@convart.com"})
admin.spree_role_ids=[1]
admin.save!(validate: false)

admin = Spree::User.new @password_attrs.merge({email: "thani@convart.com"})
admin.spree_role_ids=[1]
admin.save!(validate: false)

puts 'Creating Users'
user = Spree::User.new @password_attrs.merge({email: "user@convart.com"})
user.spree_role_ids=[2]
user.save!(validate: false)

