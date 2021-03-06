class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(args)
    @chainring = args[:chainring] || 40
    @cog       = args.fetch(:cog, 18) # fetchでもデフォルト値設定可能
    @wheel     = args[:wheel]
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

  def initialize(args)
    args = defaults.merge(args)
    @rim  = args[:rim]
    @tire = args[:tire]
  end

  def diameter
    rim + (tire * 2)
  end

  def circumference
    diameter * Math::PI
  end

  private

    def defaults
      {
        rim: 10,
        tire: 20
      }
    end
end


gear = Gear.new(chainring: 52, cog: 11, wheel: Wheel.new(26, 1.5))
puts gear.gear_inches

