require "byebug"

class Flower
  attr_accessor :sepal_width, :sepal_length, :petal_width, :petal_length, :type, :dist

  def initialize(data_array)
    @sepal_width = data_array[1].to_f
    @sepal_length = data_array[0].to_f
    
    @petal_width = data_array[3].to_f
    @petal_length = data_array[2].to_f
    
    @type = data_array[4]
  end


  def classify(flowers, count)
    nearest_neighboors = self.nearest_neighboors(flowers, count)
    
    most_frequent(nearest_neighboors).keys.last
  end


  def distance(flower)
    sW = self.sepal_width - flower.sepal_width
    sL = self.sepal_length - flower.sepal_length

    pW = self.petal_width - flower.petal_width
    pL = self.petal_length - flower.petal_length

    Math.sqrt(sW*sW + sL*sL + pW*pW + pL*pL)
  end


  def most_frequent(flowers)
    
    frequency = {}

    flowers.each do |flower|
      frequency[flower.type] = (frequency[flower.type] || 0) + 1
    end

    ordered_hash = frequency.sort_by{|key, value| value}.to_h
    return {ordered_hash.keys.last => ordered_hash.values.last}
  end

  def nearest_neighboors(flowers, count)
    flowers.each do |flower|
      flower.dist = self.distance(flower)
    end

    flowers.sort! { |a, b| a.dist <=> b.dist }

    nearest_neighboors = []

    count.times do |i|
      nearest_neighboors << flowers[i]
    end

    nearest_neighboors
  end
    
    
end
