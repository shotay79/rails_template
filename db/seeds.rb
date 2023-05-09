# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Product.delete_all
10.times do
	p = Product.create(name: Faker::Commerce.unique.product_name,
					price: rand(500..10000).to_i,
					description: Faker::Hipster.sentence)
	puts "Creating..#{p.name}"

	# downloaded_image = open("https://source.unsplash.com/600*600/?#{p.name}")
	# p.image.attach(io: downloaded_image, filename: "m-#{p.name}.jpg")
	p.image.attach(io: File.open('app/assets/images/apple.jpg'), filename: 'apple.jpg')
end