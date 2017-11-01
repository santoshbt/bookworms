10.times do |genre|
	Genre.create(name: "My Genre #{genre}", description: "Some Content")
end
puts "10 posts have been created"