f = File.open("day6_input")
s = f.read  # 全て読み込む
f.close
lines = s.split("\n")
count = 0
answers = ""
person_num = 0
lines.each_with_index do |line, idx|
  if line == ""
    unless person_num == 0
      group_answer = ""
      [*'a'..'z'].each do |char|
        group_answer += char if answers.scan(char).size == person_num
      end
      count += group_answer.size
      answers = ""
      person_num = 0
    end
  else
    person_num += 1
    answers += line
  end

  if idx + 1 == lines.size
    group_answer = ""
    [*'a'..'z'].each do |char|
      group_answer += char if answers.scan(char).size == person_num
    end
    count += group_answer.size
  end
end
p count