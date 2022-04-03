class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(args)
    # args = defaults.merge(args) デフォルト値を分離する方法
    # @chainring = args[:chainring] || 40
    # @cog = args[:cog] || 18
    # argsにchainring, cogがなければ第二引数が使われる
    @chainring = args.fetch(:chainring, 40)
    @cog = args.fetch(:cog, 18)
    @wheel = args[:wheel]
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    ratio * wheel.diameter
  end

  # デフォルト値がより複雑な時使用する
  def defaults
    { chainring: 40, cog: 18 }
  end
end

class Wheel
  attr_reader :rim, :tire

  def initialize(args)
    @rim = args.fetch(:rim, 10)
    @tire = args.fetch(:tire, 10)
  end

  def diameter
    rim + (tire * 2)
  end
end
