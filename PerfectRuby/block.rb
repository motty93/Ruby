%w(Alice Bob Charlie).each do |name|
  puts "Hello, #{name}."
end

def block_sample
  puts 'stand up'

  # ブロックが与えられているかどうかのチェック
  yield if block_given?

  puts 'sit down'
end

block_sample do
  puts 'walk'
end

block_sample


# ブロックの戻り値
def display_value
  puts yield
end

block = display_value do
  4423
end

# 最後に評価された式の値を返す
block


def with_current_time
  yield Time.now
end

with_current_time do |now|
  puts now.year
end
