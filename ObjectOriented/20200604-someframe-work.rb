# デフォルト値のハッシュをマージすることでデフォルト値を指定している
# initializeからデフォルト値を完全に除去し、独立したラッパーメソッド内に隔離する方法
# デフォルト値が単純な数字や文字列以上のものであるとき(単純に複雑なとき)は、defaultsメソッドを実装する

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


