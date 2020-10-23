# ||を使ってデフォルト値を明示的に設定する
class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(args)
    @chainring = args[:chainring] || 40
    @cog = args.fetch(:cog, 18)
    @wheel = args[:wheel]
  end

  def gear_inches
    # 依存オブジェクトの注入
    ratio * wheel.diameter
  end

  def ratio
    chainring / cog.to_f
  end
end

class Wheel
  attr_reader :rim, :tire

  def initialize(rim, tire)
    @rim  = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end

  def circumference
    diameter * Math::PI
  end
end


