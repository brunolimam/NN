require "./iris_data"
require "./flower"

porcentagem_acertos = []

10.times do |i|
	trainning_data, random_data = IrisData.getIris(100)
	acertos = 0

	random_data.each do |flower|
		prediction = flower.classify(trainning_data, 1)

		if flower.type == prediction
			acertos+=1
		end
	end

	puts ("acertou #{acertos} de #{random_data.size} flores testadas")
	porcentagem_acertos << acertos.to_f/random_data.size.to_f
end

puts "A media foi #{porcentagem_acertos.inject(:+).to_f/porcentagem_acertos.size.to_f}"
