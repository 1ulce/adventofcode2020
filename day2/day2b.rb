f = File.open("day2_input")
s = f.read  # 全て読み込む
f.close
lines = s.split("\n")
answer = 0
lines.each do |line|
  array = line.split(" ")
  first, second = array[0].split("-").map(&:to_i)
  char = array[1][0]
  text = array[2]
  if char.size == 1
    answer += 1 if (text[first - 1] == char) ^ (text[second - 1] == char)
  else
    p "here"
  end
end
p answer