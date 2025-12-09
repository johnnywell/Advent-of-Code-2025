sum = 0
ranges = []

File.read("input.txt").strip.split(",").each do |range|
	start_num, end_num = range.split("-").map(&:to_i)
	ranges << [start_num, end_num]
end

# Gera todos os IDs inválidos possíveis
(1..5).each do |pattern_length|  # o máximo são 10 dígitos, então pattern length 5
	first_half_start = 10 ** (pattern_length - 1)
	first_half_end = 10 ** pattern_length - 1
	
	(first_half_start..first_half_end).each do |first_half|
		invalid_id = (first_half.to_s * 2).to_i
		
		# Checa se o invalid_id está em algum range que lemos do input
		ranges.each do |start_num, end_num|
			if invalid_id >= start_num && invalid_id <= end_num
				sum += invalid_id
				break # sai pra não contar duas vezes 
			end
		end
	end
end

puts "Total: #{sum}"