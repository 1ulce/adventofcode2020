f = File.open("day11_input")
s = f.read  # 全て読み込む
f.close
lines = s.split("\n")
n = 1
while true
  new_lines = []
  lines.each_with_index do |line, i|
    new_line = ""
    
    line.size.times do |idx|
      case line[idx]
      when "."
        new_line += "."
      when "L"
        occupied = []
        unless i == 0
          occupied << lines[i - 1][idx - 1] unless idx == 0
          occupied << lines[i - 1][idx]
          occupied << lines[i - 1][idx + 1] unless idx == line.size - 1
        end
        unless i == lines.count - 1
          occupied << lines[i + 1][idx - 1] unless idx == 0
          occupied << lines[i + 1][idx]
          occupied << lines[i + 1][idx + 1] unless idx == line.size - 1
        end
        occupied << line[idx - 1] unless idx == 0
        occupied << line[idx + 1] unless idx == line.size - 1
        occupied_count = occupied.count("#")
        if occupied_count == 0
          new_line += "#"
        else
          new_line += "L"
        end
      when "#"
        occupied = []
        unless i == 0
          occupied << lines[i - 1][idx - 1] unless idx == 0
          occupied << lines[i - 1][idx]
          occupied << lines[i - 1][idx + 1] unless idx == line.size - 1
        end
        unless i == lines.count - 1
          occupied << lines[i + 1][idx - 1] unless idx == 0
          occupied << lines[i + 1][idx]
          occupied << lines[i + 1][idx + 1] unless idx == line.size - 1
        end
        occupied << line[idx - 1] unless idx == 0
        occupied << line[idx + 1] unless idx == line.size - 1
        occupied_count = occupied.count("#")
        if occupied_count > 3
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