10.times do |genre|
	Genre.create(name: "My Genre #{genre}")
end
puts "10 posts have been created"