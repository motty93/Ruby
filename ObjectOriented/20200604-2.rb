# Gearが外部インターフェースの一部の場合
module SomeFramework
  class Gear
    attr_reader :chainring, :cog, :wheel

    def initialize(args)
      args = defaults.merge(args)
      @chainring = args[:chainring]
      @cog = args[:cog]
      @wheel = args[:wheel]
    end

    def gear_inches
      # 依存オブジェクトの注入
      ratio * wheel.diameter
    end

    def ratio
      chainring / cog.to_f
    end

    private

    def defaults
      { chainring: 40, cog: 18 }
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
end

# 外部のインターフェースをラップし、自身を変更から守る
module GearWrapper
  def self.gear(args)
    SomeFramework::Gear.new(args[:chainring], args[:cog], args[:wheel])
  end
end

# 引数を持つハッシュを渡すことでGearのインスタンスを作成できるようになった
GearWrapper.gear(chainring: 52, cog: 11, wheel: Wheel.new(26, 1.5)).gear_inches
