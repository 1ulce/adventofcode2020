f = File.open("day12_input")
s = f.read  # 全て読み込む
f.close
lines = s.split("\n")
position = [0,0]
unit = [[1,0], [0,-1],[-1,0],[0,1]]
face = 0
lines.each do |line|
  direction = line[0]
  num = line.delete("^0-9").to_i
  case direction
  when "N"
    position[1] += num

  when "E"
    position[0] += num
  when "S"
    position[1] -= num
  when "W"
    position[0] -= num
  when "R"
    face += num / 90 
    face = face % 4 if face > 3
  when "L"
    face -= num / 90 
    face = face % 4 if face < 0
  when "F"
    unit[face].map{|n| n * num}.each_with_index do |x, idx|
      position[idx] += x
    end
  end
end

p position[0].abs + position[1].abs