# Enumerableな機能を提供する
# StringクラスにはEnumerableをincludeしていない

[].each
{}.each
(1..10).each
''.each_char
10.times
loop

# Enumerableオブジェクトはto_enumメソッドからも得られる。
puts [1, 2, 3].to_enum
puts 'Alice'.enum_for(:each_char)
