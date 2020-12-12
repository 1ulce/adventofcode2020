f = File.open("day12_input")
s = f.read  # 全て読み込む
f.close
lines = s.split("\n")
position = [0, 0]
waypoint = [10,1]
# [10,1], [1,-10], [-10, -1], [-1, 10]

face = 0
lines.each do |line|
  direction = line[0]
  num = line.delete("^0-9").to_i
  case direction
  when "N"
    waypoint[1] += num
  when "E"
    waypoint[0] += num
  when "S"
    waypoint[1] -= num
  when "W"
    waypoint[0] -= num
  when "R"
    case (num / 90) % 4 
    when 0 
      # do nothing
    when 2
      waypoint = waypoint.map{|n| -n}
    when 1
      waypoint = [waypoint[1], -waypoint[0]]
    when 3
      waypoint = [-waypoint[1], waypoint[0]]
    end
  when "L"
    case (num / 90) % 4
    when 0 
      # do nothing
    when 2
      waypoint = waypoint.map{|n| -n}
    when 1
      waypoint = [-waypoint[1], waypoint[0]]
    when 3
      waypoint = [waypoint[1], -waypoint[0]]
    end
  when "F"
    waypoint.map{|n| n * num}.each_with_index do |x, idx|
      position[idx] += x
    end
  end
end

p position[0].abs + position[1].abs