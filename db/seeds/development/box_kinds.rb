names = %w(おかず2種類＋ごはん おかず3種類＋ごはん)
0.upto(1) do |i|
  BoxKind.create(
    name: names[i],
    capacity: i+2
  )
end
