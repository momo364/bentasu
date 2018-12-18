names = ["乳","卵","小麦","そば","落花生","えび","かに","大豆","鶏肉","豚肉"]
0.upto(9) do |idx|
  Allergy.create(
    name: "#{names[idx]}"
  )
end
