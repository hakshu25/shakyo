class Customer
  def statement
    total_amount, frequent_renter_points = 0, 0
    result = "Rental Record for #{@name}\n"
    @rentals.each do |element|
      # レンタルポイントを加算
      frequent_renter_points += element.frequent_renter_points
      # このレンタルの料金を表示
      result += "\t" + element.movie.title + "\t" + element.charge.to_s + "\n"
      total_amount += element.charge
    end
    # フッター行を追加
    result += "Amount owed is #{total_amount}\n"
    result += "You earned #{frequent_renter_points} frequent renter points"
    result
  end
end

class Rental
  def frequent_renter_points
    points = 1
    # 新作2日間レンタルでボーナス点を加算
    if movie.price_code == Movie.NEW_RELEASE && days_rented > 1
      points += 1
    end
    points
  end
end
