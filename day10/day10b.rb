f = File.open("day10_input")
s = f.read  # 全て読み込む
f.close
nums = s.split("\n").map(&:to_i).sort
nums = [0] + nums + [nums.max + 3]
diffs = {}
diffs[1] = 1
diffs[2] = 0 
diffs[3] = 1 
renzoku_1 = []
renzoku = 0
nums.each_with_index do |num, idx|
  break if idx == nums.count - 1
  diff = nums[idx+1] - num
  diffs[diff] += 1
  if diff == 1
    renzoku += 1
  else
    renzoku_1 << renzoku
    renzoku = 0
  end
end
answer = 1
units = [1, 1, 2, 4, 7]
renzoku_1.each do |n|
  answer = answer * units[n]
end
p answer

# 合計2 → 2
# 11
# 2
# 合計3 → 4
# 111
# 21 *2
# 3
# 合計4 → 7
# 1111
# 211 * 3
# 22
# 31 *2
