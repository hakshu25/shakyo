class Customer
  def statement
    result = "<h1>Rentals for <em>#{@name}</em></h1><p>\n"
    @rentals.each do |element|
      # このレンタルの料金を表示
      result += "\t" + element.movie.title + ": " + element.charge.to_s + "<br>\n"
    end
    # フッター行を追加
    result += "<p>You owe <em>#{total_charge}</em></p>\n"
    result += "On this rental you earned " +
    "<em>#{total_frequent_renter_points}</em> " +
    "frequent renter points</p>"
    result
  end
end