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
  path = Rails.root.join("db/seeds/development", "#{idx+1}.png")
  file = Rack::Test::UploadedFile.new(path, "image/png", true)
  DishImage.create(
    dish: dish,
    uploaded_image: file
  )
end
