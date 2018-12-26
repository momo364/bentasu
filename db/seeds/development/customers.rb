names = %w(丸山隆平 大倉忠義)
usernames = %w(Ryu Tada)
0.upto(1) do |i|
  Customer.create(
    name: names[i],
    telephone: "090-8888-8888",
    mail_address: "eight@j.net",
    username: usernames[i],
    password: "kan8",
    password_confirmation: "kan8"
  )
end
