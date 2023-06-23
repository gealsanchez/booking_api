# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(name: "Eddie")
Automobile.create(model: "Mazda 626", photo: "https://st.depositphotos.com/1002254/1330/v/450/depositphotos_13300958-stock-illustration-orange-muscle-car.jpg", location: "5th Avenue Branch", year: 1976, rate: 8)
Automobile.create(model: "Ford 357", photo: "https://st5.depositphotos.com/78521800/65206/v/600/depositphotos_652069170-stock-illustration-american-muscle-car-vector-illustration.jpg", location: "Manhattan Branch", year: 1987, rate: 9)
Ticket.create(user_id: 1, automobile_id: 1, date: "2023-04-10")
Ticket.create(user_id: 1, automobile_id: 2, date: "2023-04-11")