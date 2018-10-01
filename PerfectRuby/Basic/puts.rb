class Ruler
  def initialize(length)
    @length = length
  end

  # to_sメソッドのオーバーライド
  def to_s
    '=' * @length
  end
end

ruler = Ruler.new(30)
# 自身を文字列として表示
puts ruler
p ruler
