f = File.open("day9_input")
s = f.read  # 全て読み込む
f.close
nums = s.split("\n").map(&:to_i)
options = []
base = 0
nums.each_with_index do |line, idx|
  if options.count < 25
  else
    flag = false
    25.times do |n|
      sorted_options = options.sort
      remain = line - sorted_options[n]
      if options.include?(remain)
        flag = true
        break
      end
    end
    unless flag
      p line
      return
    end
    options = options.drop(1)
  end
  options << line
end