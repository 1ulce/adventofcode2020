f = File.open("day1_input")
s = f.read  # 全て読み込む
f.close
numbers = s.split("\n").map(&:to_i)

numbers.each_with_index do |num1, idx|
  num2_idx = idx
  (numbers.count - idx - 1).times do
    num2_idx += 1 
    num2 = numbers[num2_idx]
    num3_idx = num2_idx
    
    (numbers.count - num2_idx - 1).times do
      num3_idx += 1 
      num3 = numbers[num3_idx]
      p num1 * num2 * num3 if num1 + num2 + num3 == 2020
    end
  end
end