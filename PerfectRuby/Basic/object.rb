o = Object.new

# 自身についての情報を返す
puts o.class
puts o.is_a?(Object)
puts o.object_id
puts o.nil?
puts o.frozen?

# 自身のブロック引数に対してブロックを実行し、自身を返す
o.tap { |v| puts v }

Object.new == Object.new
[1, 2] == [1, 2]
/pattern/ == /pattern/
'Alice' == 'Alice'
