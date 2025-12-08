# https://adventofcode.com/2025/day/1
position = 50
zeros = 0

def times(n)
	case n
	when 0 then "never"
	when 1 then "once"
	when 2 then "twice"
	when 3 then "thrice"
	else "#{n} times"
	end
end

File.foreach("input.txt").with_index(1) do |rotation, line_num|
	puts "- The dial starts by pointing at #{position}" if line_num == 1
	direction, distance = rotation.match(/([LR])(\d+)/)&.captures
	raise ArgumentError, "Invalid format at line #{line_num}" unless direction
	
	distance = direction == "L" ? -distance.to_i : distance.to_i
	
	crosses = (distance.positive? ? 
		((position + distance) / 100) - (position / 100) :
		((position + 99) / 100) - ((position + distance + 99) / 100))
	
	position = (position + distance) % 100
	zeros += crosses
	
	if crosses.zero?
		puts "- The dial is rotated #{rotation.strip} to point at #{position}."
	else
		puts "- The dial is rotated #{rotation.strip} to point at #{position}; during this rotation, it points at 0 #{times(crosses)}."
	end
end

puts "Secret password: #{zeros}"