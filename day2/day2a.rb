f = File.open("day2_input")
s = f.read  # 全て読み込む
f.close
lines = s.split("\n")
answer = 0
lines.each do |line|
  array = line.split(" ")
  from, to = array[0].split("-").map(&:to_i)
  char = array[1][0]
  if char.size == 1
    num = array[2].count(char)
    answer += 1 if (from..to).include?(num)
  else
    p "here"
  end
end
p answer