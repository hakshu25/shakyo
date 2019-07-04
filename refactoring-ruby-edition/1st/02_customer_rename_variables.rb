# 人間が理解できるようコーディングする
# 名前を明確にすることで目的がわかりやすくなる
def amount_for(rental)
  result = 0
  # 各行の金額を計算
  case rental.movie.price_code
  when Movie::REGULAR
    result += 2
    result += (rental.days_rented - 2) * 1.5 if rental.days_rented > 2
  when Movie::NEW_RELEASE
    result += rental.days_rented * 3
  when Movie::CHILDRENS
    result += 1.5
    result += (rental.days_rented - 3) * 1.5 if rental.days_rented > 3
  end
  result
end