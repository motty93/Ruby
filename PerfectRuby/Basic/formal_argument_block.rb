def block_sample(&block)
  puts 'stand up'

  block.call if block

  puts 'sit down'
end

block_sample do
  puts 'walk'
end

p1 = Proc.new { |val| val.upcase }
p2 = :upcase.to_proc

p1.call('hi')
p2.call('hi')
