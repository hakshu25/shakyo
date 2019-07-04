# 一時変数から問い合わせメソッドへ
# 一時変数は長くて複雑なルーチンを助長するため
# 問い合わせメソッドは任意のメソッドから呼び出すため、シンプルな設計に変更する効果がある

class Customer
  def statement
    frequent_renter_points = 0
    result = "Rental Record for #{@name}\n"
    @rentals.each do |element|
      # レンタルポイントを加算
      frequent_renter_points += element.frequent_renter_points
      # このレンタルの料金を表示
      result += "\t" + element.movie.title + "\t" + element.charge.to_s + "\n"
    end
    # フッター行を追加
    result += "Amount owed is #{total_charge}\n"
    result += "You earned #{frequent_renter_points} frequent renter points"
    result
  end

  private

  def total_charge
    result = 0
    @rentals.each do |element|
      result += element.charge
    end
    result
  end
end