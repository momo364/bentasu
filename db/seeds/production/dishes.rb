names = ["エビフライ","とんかつ","生姜焼き","油淋鶏","ハンバーグ"]
allergies = ["卵","そば"]
categories = %w{1 0 0 2 1}
0.upto(4) do |idx|
  dish = Dish.create(
    name: "#{names[idx]}",
    price: (idx + 1) * 100,
    calorie: (idx + 1) * 100 - 30,
    category: categories[idx],
    potential: true
  )
  #0.upto(1) do |i|
  #  allergy = Allergy.new
  #  allergy.name = "#{allergies[i]}"
  #  allergy = Allergy.find(i+idx+1)
  #  dish.allergies << allergy 
  #end
end
