sum = 0
File.foreach("input.txt").with_index(1) do |id_ranges|
	ranges = id_ranges.split(",")
	ranges.each do |range|
		start_num, end_num = range.split("-").map(&:to_i)
		(start_num..end_num).each do |candidate_id|
			candidate_id_str = candidate_id.to_s
			length = candidate_id_str.length
			first_half = candidate_id_str[0...length/2]
			second_half = candidate_id_str[length/2..length]
			sum += candidate_id if first_half == second_half
		end
	end
end

puts "Total #{sum}"