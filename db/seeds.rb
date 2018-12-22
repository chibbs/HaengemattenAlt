# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Hammock.delete_all
Review.delete_all

hammock1 = Hammock.create(name: 'Stadtpark', description: 'ganz super chillig da', latitude: '1.234', longitude: '19.234')
hammock2 = Hammock.create(name: 'Uni-Strand', description: 'mit Blick auf die Spree', latitude: '1.234', longitude: '19.234')
hammock3 = Hammock.create(name: 'Autobahn', description: 'Mittelstreifen', latitude: '1.234', longitude: '19.234')
hammock4 = Hammock.create(name: 'Schöneweide', description: 'neben dem Penny', latitude: '1.234', longitude: '19.234')
Review.create(rating: 1, comment: 'Echt eklig da!', hammock_id: hammock4.id)
Review.create(rating: 5, comment: 'genial', hammock_id: hammock2.id)
Review.create(rating: 3, comment: 'schon okay da...', hammock_id: hammock1.id)
Review.create(rating: 4, comment: 'Ich gehe da immerzu hin. Morgens und abends. Und manchmal schlafe ich da sogar ^^', hammock_id: hammock1.id)