class RevealingReferences
  attr_reader :data

  def initialize(data)
    @wheels = wheelify(data)
  end

  def diameteres
    wheels.collect { |wheel| diameter(wheel) }
  end
  # これでだれでもwheelにrim/tireを送れる

  def diameter(wheel)
    wheel.rim + (wheel.tire * 2)
  end

  Wheel = Struct.new(:rim, :tire)
  def wheelify(data)
    data.collect do |cell|
      Wheel.new(cell[0], cell[1])
    end
  end
end

