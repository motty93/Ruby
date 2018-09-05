begin
  # do_processが存在しないのでrescueで捕捉される
  do_process
rescue LoadError => e
  puts "#{e.class}が発生しました。"
rescue NameError => e
  puts "#{e.class}が発生しました。"
rescue => e
  puts "#{e.class}:#{e.message}"
end
