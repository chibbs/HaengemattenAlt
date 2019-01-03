# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Review.delete_all
Site.delete_all
Size.delete_all
User.delete_all
ActiveStorage::Attachment.all.each { |attachment| attachment.purge }

user1 = User.create(first_name: 'Max', last_name: 'Mustermann', email: 'max@mustermann.de', password: 'password')
sizes = Size.create(name: 'small', text: '2-3 m')
sizem = Size.create(name: 'medium', text: '4-5 m')
sizel = Size.create(name: 'large', text: '6+ m')
site1 = Site.create(name: 'Stadtpark', description: 'ganz super chillig da', latitude: '1.234', longitude: '19.234', user_id: user1.id)
site2 = Site.create(name: 'Uni-Strand', description: 'mit Blick auf die Spree', latitude: '1.234', longitude: '19.234', user_id: user1.id)
site3 = Site.create(name: 'Autobahn', description: 'Mittelstreifen', latitude: '1.234', longitude: '19.234', user_id: user1.id)
site4 = Site.create(name: 'Schöneweide', description: 'neben dem Penny', latitude: '1.234', longitude: '19.234', user_id: user1.id)
site1.sizes << [sizes, sizem]
site2.sizes << [sizem]
site3.sizes << [sizel]
site4.sizes << [sizes, sizem, sizel]
site4.images.attach(io: File.open('app/assets/images/avatar.png'), filename: 'avatar.png', content_type: 'image/png')
Review.create(rating: 1, comment: 'Echt eklig da!', site_id: site4.id, user_id: user1.id)
Review.create(rating: 5, comment: 'genial', site_id: site2.id, user_id: user1.id)
Review.create(rating: 3, comment: 'schon okay da...', site_id: site1.id, user_id: user1.id)
Review.create(rating: 4, comment: 'Ich gehe da immerzu hin. Morgens und abends. Und manchmal schlafe ich da sogar ^^', site_id: site1.id, user_id: user1.id)