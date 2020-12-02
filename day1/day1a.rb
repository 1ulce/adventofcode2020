f = File.open("day1_input")
s = f.read  # 全て読み込む
f.close
numbers = s.split("\n").map(&:to_i)

numbers.each_with_index do |num1, idx|
  num2_idx = idx
  (numbers.count - idx - 1).times do
    num2_idx += 1 
    num2 = numbers[num2_idx]
    p num1 * num2 if num1 + num2 == 2020
  end
end