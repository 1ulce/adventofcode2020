f = File.open("day11_input")
s = f.read  # 全て読み込む
f.close
lines = s.split("\n")
#m = 1

while true
  # p m
  # m += 1
  new_lines = []
  lines.each_with_index do |line, i|
    new_line = ""
    
    line.size.times do |idx|
      case line[idx]
      when "."
        new_line += "."
      when "L"
        occupied = []
        
        [[-1,-1],[-1,0],[-1,1],[1,-1],[1,0],[1,1],[0,-1],[0,1]].each do |direction|
          n = 1
          while true
            if (idx + direction[1] * n) < 0 || (idx + direction[1] * n) > line.size - 1
              occupied << "."
              break
            elsif (i + direction[0] * n) < 0 || (i + direction[0] * n) > lines.count - 1
              occupied << "."
              break
            else
              if lines[(i + direction[0] * n)][(idx + direction[1] * n)] == "L" || lines[(i + direction[0] * n)][(idx + direction[1] * n)] == "#"
                occupied << lines[(i + direction[0] * n)][(idx + direction[1] * n)]
                break
              end
            end
            n += 1
          end
          #p occupied
        end

        occupied_count = occupied.count("#")
        if occupied_count == 0
          new_line += "#"
        else
          new_line += "L"
        end
      when "#"
        occupied = []
        
        [[-1,-1],[-1,0],[-1,1],[1,-1],[1,0],[1,1],[0,-1],[0,1]].each do |direction|
          n = 1
          while true
            if (idx + direction[1] * n) < 0 || (idx + direction[1] * n) > line.size - 1
              occupied << "."
              break
            elsif (i + direction[0] * n) < 0 || (i + direction[0] * n) > lines.count - 1
              occupied << "."
              break
            else
              if lines[(i + direction[0] * n)][(idx + direction[1] * n)] == "L" || lines[(i + direction[0] * n)][(idx + direction[1] * n)] == "#"
                occupied << lines[(i + direction[0] * n)][(idx + direction[1] * n)]
                break
              end
            end
            n += 1
          end
          #p occupied
        end
        
        occupied_count = occupied.count("#")
        if occupied_count > 4
          new_line += "L"
        else
          new_line += "#"
        end
      end
    end
    new_lines << new_line
  end

  break if new_lines == lines
  lines = new_lines
end

p answer = new_lines.map{|l|l.count("#")}.sum