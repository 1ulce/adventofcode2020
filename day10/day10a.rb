f = File.open("day10_input")
s = f.read  # 全て読み込む
f.close
nums = s.split("\n").map(&:to_i).sort
base = 0
diffs = {}
diffs[1] = 1
diffs[2] = 0 
diffs[3] = 1 
nums.each_with_index do |num, idx|
  break if idx == nums.count - 1
  diff = nums[idx+1] - num
  diffs[diff] += 1
end
p diffs[1] * diffs[3]