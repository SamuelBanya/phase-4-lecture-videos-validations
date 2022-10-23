# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Production.destroy_all()
CrewMember.destroy_all()


Production.create(title: "Carmen", genre: "Opera", budget: 80000.00, image: "")
Production.create(title: "Cats", genre: "Musical", budget: 50000.00, image: "")
Production.create(title: "Hamilton", genre: "Musical", budget: 100000.00, image: "")
Production.create(title: "Hamlet", genre: "Shakespearean", budget: 70000.00, image: "")

30.times{CrewMember.create(name:Faker::Name.name, job_title:"Stagehand", salary: 65000.00, production:Production.all.sample)}