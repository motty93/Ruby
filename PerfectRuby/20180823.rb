# メソッドの復習

def hello(names)
  names.each do |name|
    puts "Hello, #{name.upcase}"
  end
end

rubies = ['MRI', 'jruby', 'rubinius']

hello(rubies)

File.open '../README.md' do |file|
  puts file.read
end

