class RevealingReferences
  attr_reader :wheels

  def initialize(data)
    @wheels = wheelify(data)
  end

  def diameteres
    wheels.map { |wheel| diameter(wheel) }
  end

  def gear_inches(ratio, wheel)
    ratio * diameter(wheel)
  end

  Wheel = Struct.new(:rim, :tire)
  def wheelify(data)
    data.map do |cell|
      Wheel.new(cell[0], cell[1])
    end
  end

  private

  def diameter(wheel)
    wheel.rim + (wheel.tire * 2)
  end
end

revealing_reference = RevealingReferences.new([[622, 20], [622, 23]])
puts revealing_reference
