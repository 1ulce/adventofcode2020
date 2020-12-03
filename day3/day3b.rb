f = File.open("day3_input")
s = f.read  # 全て読み込む
f.close
lines = s.split("\n")
answer = 1

lists = [[1,1],[3,1],[5,1],[7,1],[1,2]]
lists.each do |list|
  x = 0
  trees = 0
  lines.each_with_index do |line, idx|
    next if idx.odd? && list[1] == 2
    x -= line.size if line[x] == nil
    trees += 1 if line[x] == "#"
    x += list[0]
  end
  answer *= trees
  p trees
end
p answer