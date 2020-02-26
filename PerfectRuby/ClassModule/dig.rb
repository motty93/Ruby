# railsでparamsを取得する際に使えそう

hash = {
  alice: { books: { wonder: 1234 }},
  charlie: {}
}

hash[:charlie][:books][:chocolate] #=> NoMethodError
hash.dig(:alice, :books, :wonder) #=> nil


hash = { a: [{ word: 'alice' }, { word: 'alpha' }] }
hash.dig(:a, 0, :word) #=> 'alice'

