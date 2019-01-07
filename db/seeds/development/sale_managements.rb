1.upto(5) do |i|
  dish = Dish.find(i)
  SaleManagement.create(
    dish: dish,
    planned_number: 30,
    made_number: 0,
    sold_number: 0
  )
end
