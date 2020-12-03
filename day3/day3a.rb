f = File.open("day3_input")
s = f.read  # 全て読み込む
f.close
lines = s.split("\n")
answer = 0
x = 0
lines.each do |line|
  x -= line.size if line[x] == nil
  answer += 1 if line[x] == "#"
  x += 3
end
p answer