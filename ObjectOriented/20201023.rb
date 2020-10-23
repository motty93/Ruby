class Trip
  attr_reader :bicycles, :customers, :vehicle

  # mechanicは何でもおｋ
  def prepare(mechanic)
    machanic.prepare_bicycles(bicycles)
  end

end

# このクラスのインスタンスをわたすことになったとしても動作する
class Mechanic
  def prepare_bicycles(bicycles)
    bicycles.each { |bicycles| prepare_bicycles(bicycle) }
  end

end
