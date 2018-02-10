# 正規表現

text = <<TEXT
I love Ruby.
Python is a great language.
Java and JavaScript are different.
TEXT

puts text.scan(/[A-Z][A-Za-z]+/)

text2 = <<TEXT
私の郵便番号は1234567です。
僕の住所は6770056 兵庫県西脇市板波町1234だよ。
TEXT

puts text2.gsub(/(\d{3})(\d{4})/,'\1-\2')

# 正規表現リテラル /正規表現/
regex = /\d{3}-\d{4}/
puts regex.class

# 正規表現と文字列の比較
# =~でマッチした位置を返す
puts '123-4567' =~ regex
# マッチしない場合はnil
puts '123-456' =~ regex

# if文にもよく使われる
if '123-4567' =~ regex
    puts 'マッチしました'
else
    puts 'マッチしませんでした'
end

# !~だとマッチするとfalse
puts '123-4567' !~ regex
# マッチしない場合はtrue
puts '123-456' !~ regex

# マッチした部分を配列のように取得する方法
str = '私の誕生日は1977年7月17日です。'
m = /(\d+)年(\d+)月(\d+)日/.match(str)
puts m # 1977年7月17日
puts m[0] # 1977年7月17日
puts m[1] # 1977
puts m[2] # 7
puts m[3] # 17
# 2番目から2個取得する
puts m[2, 2]

# キャプチャの結果に命名できる
m2 = /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/.match(str)
puts m2[:year]
puts m2[:month]
puts m2[:day]

# =~演算子でキャプチャ名をローカル変数に割り当てられる
# 左辺を正規表現リテラル 右辺を文字列にしないとエラー
# 左辺の正規表現を変数に変えるても無効
if /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/ =~ str
    puts "#{year}/#{month}/#{day}"
end

# 便利メソッド

# scan
# @param Regexp
# @return Array 
puts '123 456 789'.scan(/\d+/).class
#キャプチャにも対応
puts '1977年7月17日 2016年12月31日'.scan(/(\d+)年(\d+)月(\d+)日/)

# [],slice,slice!
# 最初にマッチした部分のみ切り出す
text3 = '私の郵便番号は123-4567です。456-7890'
puts text3[/\d{3}-\d{4}/]
# キャプチャは第二引数で指定可能
str4 = '1977年7月17日 2016年12月31日'
puts str4[/(\d+)年(\d+)月(\d+)日/, 2]

