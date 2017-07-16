require "./flower"

class IrisData

  def self.getIris(count)
    trainning_data = []
    test_data = []

    File.open("irisValues.txt", "r") do |file|
      lines = []
      while (line = file.gets)
        lines << line.strip
      end


      lines.size.times do |i|
        rand_value = rand(lines.size-1)
        rand_line = lines.delete_at(rand_value)

        components = rand_line.split(",")
        flower = Flower.new(components)

        if trainning_data.size < count
          trainning_data << flower
        else
          test_data << flower
        end
      end
      
    end

    return trainning_data, test_data
  end
end