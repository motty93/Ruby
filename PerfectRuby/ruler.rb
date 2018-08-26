#class Ruler
#  attr_accessor :length
#
#  def set_default_length
#    self.length = 30
#  end
#end

#ruler = Ruler.new
#puts ruler.set_default_length # これがないとローカル変数lengthの値が定義されない
#puts ruler.length


class Ruler
  attr_accessor :length

  def initialize(length)
    @length = length
  end
end

ruler = Ruler.new(30)
puts ruler.length
