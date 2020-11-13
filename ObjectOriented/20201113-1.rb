class Bicycle
  attr_reader :size, :chain, :tire_size

  def initialize(args = {})
    @size = args[:size]
    @chain = args[:chain] || default_chain
    @tire_size = args[:tire_size] || default_tire_size
  end

  def default_chain
    '10-chain'
  end

  # サブクラスに必ずdefault_tire_sizeを実装させる
  def default_tire_size
    raise NotImplementedError,
      "This #{self.class} cannot respond to."
  end
end

class RoadBike < Bicycle
  attr_reader :tape_color

  def initialize(args)
    @tape_color = args[:tape_color]
    super(args)
  end

  def spares
    super.merge({ tape_color: tape_color })
  end

  def default_tire_size
    '24'
  end
end

class MountainBike < Bicycle
  attr_reader :rear_shock

  def initialize(args)
    @rear_shock = args[:rear_shock]
    super(args)
  end

  def spares
    super.merge({ rear_shock: rear_shock })
  end

  def default_tire_size
    '2.1'
  end
end

road_bike = RoadBike.new(
  size: 'M', tape_color: 'red'
)
p road_bike.tire_size
p road_bike.chain

mountain_bike = MountainBike.new(
  size: 'S', front_shock: 'Manitou', rear_shock: 'Fox'
)
p mountain_bike.tire_size
p road_bike.chain
