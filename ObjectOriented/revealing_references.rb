class RevealingReferences
  attr_reader :wheels

  def initialize(data)
    @wheels = wheelify(data)
  end

  def diameteres
    wheels.map do |wheel|
      wheel.rim + (wheel.tire * 2)
    end
  end

  Wheel = Struct.new(:rim, :tire)
  def wheelify(data)
    data.map do |cell|
      Wheel.new(cell[0], cell[1])
    end
  end
end

revealing_reference = RevealingReferences.new([[622, 20], [622, 23]])
puts revealing_reference
