class Bicycle
  attr_reader :size

  def initialize(args = {})
    @size = args[:size]
  end
end

class RoadBike < Bicycle
  attr_reader :tape_color

  def initialize(args)
    @tape_color = args[:tape_color]
    super(args) # RoadBikeはsuperを必ず呼ばなければならなくなった
  end
end
