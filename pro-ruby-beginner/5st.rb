# ハッシュはキーと値の組み合わせ
# 要するに連想配列
# ハッシュは変数に格納しないとputsで出力出来ない

# 空のハッシュ
{}
# キーと値の組み合わせを3つ格納
{ 'キー1' => '値1', 'キー2' => '値2', 'キー3' => '値3' }

# ハッシュクラス名確認
puts {}.class

# jsonと同様、改行もできる
{ 
  'japan' => 'yen',
  'us' => 'dollar',
  'india' => 'rupee'
}

# 同キーが出る場合は最後が有効 warningが出る
hash = { 'japan' => 'yen', 'japan' => '円'}
puts hash

# ハッシュに新規追加
hash['italy'] = 'euro'
puts hash

# 同キーは上書き
hash['japan'] = 'yen'
puts hash

# ハッシュから値取り出し
puts hash['italy']

# 存在しないkeyはnil
puts hash['brazil']

