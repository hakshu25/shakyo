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

# keyとvalueを順次取り出し
hash.each do |key, value|
    puts "#{key} : #{value}"
end

# 引数を1個にできる その場合[key, value]という配列になる
hash.each do |key_value|
    key = key_value[0]
    value = key_value[1]
    puts "#{key} : #{value}"
end

# ==でハッシュ比較
a = { 'x' => 1, 'y' => 2, 'z' => 3 }
b = { 'x' => 1, 'y' => 2, 'z' => 3 }
# true
puts a == b

# 順序が違ってもtrue
c = { 'z' => 3, 'y' => 2, 'x' => 1 }
puts a == c

# false
d = { 'x' => 1, 'y' => 2, 'z' => 2 }
puts a == d

# ハッシュの要素数
s = {}.size
# 0
puts s
# 3
puts a.size

# 要素削除
currencies = { 'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }
currencies.delete('japan')
puts currencies

# 削除したいkeyが無い場合はnilが返る
puts currencies.delete('italy').nil?

# シンボル :シンボル名
puts :apple.class
puts 'apple'.class

# 文字列よりもシンボルのほうが高速に比較できる
'apple' == 'apple'
:apple == :apple

# 同名のシンボルは同じオブジェクト
puts :apple.object_id
puts :apple.object_id

puts 'apple'.object_id
puts 'apple'.object_id

# シンボルはイミュータブル
string = 'apple'
string.upcase!
puts string

symbol = :apple
# 以下はエラーになる
# symbol.upcase!

# シンボルはハッシュのkeyにもできる
countries_money = { :japan => 'yen', :us => 'dollar', :india => 'rupee' }
countries_money[:japan]

# シンボルをkeyにする場合、jsonlikeな記法にできる
# 値を取り出す時はシンボルのまま
money = { japan: 'yen', us: 'dollar', india: 'rupee' }
puts money[:japan]

# 値もシンボルの場合
{ japan: :yen, us: :dollar, india: :rupee }

# データ型が異なると値は取り出せない
puts money['japan'].nil?

# キーワード引数(キーワード引数: デフォルト値)
def buy_burger(menu, drink: true, potato: true)
    # ハンバーガー購入
    if drink
        # ドリンク購入
    end
    if potato
        # ポテト購入
    end
end

# メソッド呼び出し(存在しない引数呼び出しはエラー)
buy_burger('cheese', drink: true, potato: true)
buy_burger('fish', drink: true, potato: false)

# デフォルト値を使う場合は引数を省略できる
buy_burger('cheese', potato: true)

# キーワード引数は呼び出し時に入れ替えられる
buy_burger('cheese', potato: true, drink: true)

# デフォルト値は省略可能 その場合呼び出し時は省略できない
def buy_cookie(menu, drink:, potato:)
end

# キーワード引数に一致するハッシュを渡すこともできる
params = { drink: true, potato: true }
buy_burger('fish', params)

# keyを配列にして返す
puts params.keys

# valueを配列にして返す
puts params.values

# keyの存在確認
puts params.has_key?(:drink)
puts params.has_key?(:fish)

# **でハッシュ展開
h = { fish: false, **params }
puts h
# エラー
# k = { fish: false, params }

puts h.merge(params)