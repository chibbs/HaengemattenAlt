# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Review.delete_all
Site.delete_all

site1 = Site.create(name: 'Stadtpark', description: 'ganz super chillig da', latitude: '1.234', longitude: '19.234')
site2 = Site.create(name: 'Uni-Strand', description: 'mit Blick auf die Spree', latitude: '1.234', longitude: '19.234')
site3 = Site.create(name: 'Autobahn', description: 'Mittelstreifen', latitude: '1.234', longitude: '19.234')
site4 = Site.create(name: 'Schöneweide', description: 'neben dem Penny', latitude: '1.234', longitude: '19.234')
Review.create(rating: 1, comment: 'Echt eklig da!', site_id: site4.id)
Review.create(rating: 5, comment: 'genial', site_id: site2.id)
Review.create(rating: 3, comment: 'schon okay da...', site_id: site1.id)
Review.create(rating: 4, comment: 'Ich gehe da immerzu hin. Morgens und abends. Und manchmal schlafe ich da sogar ^^', site_id: site1.id)