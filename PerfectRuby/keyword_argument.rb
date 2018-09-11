def keywords_with_options(alice: nil, bob: nil, **others)
  {alice: alice, bob: bob, others: others}
end

# キーワード引数として存在しないものはothersに渡される
p keywords_with_options alice: 'アリス', bob: 'ボブ', charlie: 'チャーリィ', dave: 'デブ'

# 引数の順番を変えることもできる
p keywords_with_options charlie: 'チャーリィ', bob: 'ボブ', alice: 'アリス'

# **のついた仮引数にはデフォルトでは空のハッシュがはいる
p keywords_with_options bob: 'ボブ', alice: 'アリス'
