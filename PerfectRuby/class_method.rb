class Ruler
  attr_accessor :length

  def initialize(length)
    @length = length
  end

  def self.pair(first, second)
    [Ruler.new(first), self.new(second)]
  end
end

rulers = Ruler.pair(40, 50)
puts rulers.map(&:length)
