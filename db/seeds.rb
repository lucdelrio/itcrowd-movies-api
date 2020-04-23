Movie.create(title: 'Gladiator', release_year: 2000)
Person.create(first_name: 'Russell', last_name: 'Crowe')
Participation.create(person: Person.first, movie: Movie.first, role: 'actor')

Movie.create(title: 'Forest Gump', release_year: 1994)
Person.create(first_name: 'Tom', last_name: 'Hanks')
Person.create(first_name: 'Robert', last_name: 'Zemeckis')
Person.create(first_name: 'Steve', last_name: 'Tisch')

Participation.create(person_id: Person.find_by(last_name: 'Hanks').id, movie_id: Movie.find_by(title: 'Forest Gump').id, role: 'actor')
Participation.create(person_id: Person.find_by(last_name: 'Zemeckis').id, movie_id: Movie.find_by(title: 'Forest Gump').id, role: 'director')
Participation.create(person_id: Person.find_by(last_name: 'Tisch').id, movie_id: Movie.find_by(title: 'Forest Gump').id, role: 'producer')

Admin.create(email: 'lucdelrio@itcrowd.com', password: 'itcrowd', password_confirmation: 'itcrowd')
