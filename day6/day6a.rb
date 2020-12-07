f = File.open("day6_input")
s = f.read  # 全て読み込む
f.close
lines = s.split("\n")
[*'a'..'z']
count = 0
answers = ""
lines.each_with_index do |line, idx|
  if line == ""
    chars = answers.chars
    uniq_chars = chars.uniq
    count += uniq_chars.count
    answers = ""
  else
    answers += line
  end

  if idx + 1 == lines.size
    chars = answers.chars
    uniq_chars = chars.uniq
    count += uniq_chars.count
  end
end
p count