f = File.open("day9_input")
s = f.read  # 全て読み込む
f.close
nums = s.split("\n").map(&:to_i)
options = []
base = 0
frist_answer = 0
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
      frist_answer = line
      break
    end
    options = options.drop(1)
  end
  options << line
end

up_to_idx = 0
nums.reverse.each_with_index do |line, idx|
  if frist_answer >= line
    up_to_idx = nums.count - idx - 1
    break
  end
end
reversed_nums = nums[0..up_to_idx].reverse

def add_saiki(sum, to, from, aim, nums)
  sum += nums[to]
  if sum == aim
    if to == from
      to += 1
      add_saiki(sum, to, from, aim, nums)
    else
      return [from, to]
    end
  elsif sum > aim
    from += 1
    to = from
    sum = 0
    add_saiki(sum, to, from, aim, nums)
  else # sum < aim
    to += 1
    add_saiki(sum, to, from, aim, nums)
  end
end
from = 0
to = 0
from, to = add_saiki(0, to, from, frist_answer, reversed_nums)
p reversed_nums[from..to].min + reversed_nums[from..to].max