class ObscuringReferences
  attr_reader :data

  def initialize(data)
    @wheels = wheelify(data)
  end

  def diameteres
    wheels.collect do |wheel|
      wheel.rim + (wheel.tire * 2)
    end
  end
  # これでだれでもwheelにrim/tireを送れる

  Wheel = Struct.new(:rim, :tire)
  def wheelify(data)
    data.collect do |cell|
      Wheel.new(cell[0], cell[1])
    end
  end
end

puts ObscuringReferences.new([[622,20], [622,23], [559,30]]).diameteres
