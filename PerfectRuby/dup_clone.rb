value = 'foo'
array = [value]

array_dup = array.dup
array_clone = array.clone

# 全て同じオブジェクト
puts value.object_id
puts array_dup.first.object_id
puts array_clone.first.object_id
