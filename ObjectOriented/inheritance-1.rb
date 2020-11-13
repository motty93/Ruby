require './20201027-2'

class MountainBike < Bicycle
  atttr_reader :front_shock, :rear_shock

  def initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
    super(args)
  end

  def spares
    super.merge(rear_shock: rear_shock)
  end
end

mountain_bike = MountainBike.new(
  size: 'S',
  front_shock: 'Manitou',
  rear_shock: 'Fox'
)

mountain_bike.size #=> 'S'

# Bicycleクラスは具象クラスであり、サブクラスが作られるようには書かれていない
# Bicycleは一般的な自転車の振る舞いとロードバイクに固有の振る舞いを併せ持っている
# mountain_bike.spares
# =>
# {
#   tire_size: '23', 間違い
#   chain: '10-speed',
#   tape_color: nil, 不適切
#   front_shock: 'Manitou',
#   rear_shock: 'Fox'
# }
