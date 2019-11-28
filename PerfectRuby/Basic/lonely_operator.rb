# ぼっち演算子

people = %w(alice bob carol)

person0 = people[0]
person9 = people[9]  #nilになる

person0&.capitalize
person0.capitalize

person9&.capitalize   # nil
person9.capitalize  #NoMethodErrorになる
