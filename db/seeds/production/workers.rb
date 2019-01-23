names = %w(丸山隆平 大倉忠義 高橋恭平)
usernames = %w(Ryuhei Tadayoshi Kyohei)
0.upto(2) do |idx|
  Worker.create(
    name: names[idx],
    admin: (idx % 2),
    username: usernames[idx],
    password: "password",
    password_confirmation: "password"
  )
end
