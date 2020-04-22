# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

Movie.create(title: 'Gladiator', release_year: 1999)
Person.create(first_name: 'Russell', last_name: 'Crowe')
Participation.create(person_id: Person.first.id, movie_id: Movie.first.id, role: 'actor')

Admin.create(email: 'lucdelrio@itcrowd.com', password: 'itcrowd', password_confirmation: 'itcrowd')
