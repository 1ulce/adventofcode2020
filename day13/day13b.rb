f = File.open("day13_input")
s = f.read  # 全て読み込む
f.close
lines = s.split("\n")
now = lines[0].to_i 
#space = 1
#lcm = 0
num_1 = 0
num_2 = 0
base = 0
lines[1].split(",").each_with_index do |num, idx|
  if num == "x"
    #space += 1
  else
    if num_1 == 0
      num_1 = num.to_i
      #lcm = num_1
    elsif num_2 == 0
      num_2 = num.to_i
      n = 1
      while true
        if num_2 - (base + num_1 * n) % num_2 == idx % num_2
          break
        end
        n += 1
      end
      p base + num_1 * n
      base = base + num_1 * n
      num_1 *= num_2
      num_2 = 0
    end
  end
end
