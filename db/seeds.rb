# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(:family_name => '河野', :name => '優月', :family_kana => 'こうぼ', :first_kana => 'やさしい', :email => 'a@aa', :password => 'Yuzuki0903',:admin=>true)
User.create(email: 'b@bb', password: 'Yuzuki0903')
User.create(email: 'c@ccA',    password: 'Yuzuki0903')