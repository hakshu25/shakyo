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