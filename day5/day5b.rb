f = File.open("day5_input")
s = f.read  # 全て読み込む
f.close
lines = s.split("\n")
ids = []
move = [64,32,16,8,4,2,1,4,2,1]
lines.each do |line|
  x1 = 0
  x2 = 127
  y1 = 0
  y2 = 7
  line.chars.each_with_index do |char, idx|
    #p "char:#{char} #{x1}~#{x2}:#{y1}~#{y2}"
    case char
    when "F"
      x2 -= move[idx]
    when "B"
      x1 += move[idx]
    when "R"
      y1 += move[idx]
    when "L"
      y2 -= move[idx]
    end
  end
  ids << x1 * 8 + y1
end

answer = 0
(85..883).each do |num|
  unless ids.include?(num)
    answer = num if ids.include?(num-1) && ids.include?(num+1)
  end
end
p answer

