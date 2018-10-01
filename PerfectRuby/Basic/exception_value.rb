returned =
  begin
    value = 'return value'

    raise
  rescue
    value
  ensure
    # 実行はされるが戻り値にはならない
    'this is not return value'
  end

puts returned
