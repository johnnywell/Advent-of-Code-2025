# https://adventofcode.com/2025/day/1
position = 50
zeros_count = 0

File.foreach("input.txt").with_index(1) do |rotation, line_num|
	puts "- The dial starts by pointing at #{position}" if line_num == 1
	
	direction, distance = rotation.match(/([LR])(\d+)/)&.captures
	raise ArgumentError, "Invalid format at line #{line_num}" unless direction
	
	position = (position + (direction == "L" ? -distance.to_i : distance.to_i)) % 100
	zeros_count += 1 if position.zero?
	
	puts "- The dial is rotated #{rotation.strip} to point at #{position}."
end

puts "Secret password: #{zeros_count}"