f = File.open("day7_input")
s = f.read  # 全て読み込む
f.close
lines = s.split("\n")
# dull coral bags contain 5 drab gray bags, 2 dotted chartreuse bags.
# dotted black bags contain no other bags.
s.gsub!(/bags/, "bag")
s.gsub!(/\d/, "")
shiny_gold_idx = nil
lines.each_with_index do |line, idx|
  words = line.split(" ")
  bag = "#{words[0]} #{words[1]} bag"
  shiny_gold_idx = idx if bag == "shiny gold bag"
  s.gsub!(bag, idx.to_s)
end

lines = s.split("\n")
all = {}
lines.each_with_index do |line, idx|
  words = line.split(" ")
  all[words[0]] = []
  unless words[2] == "no"
    all[words[0]] = []
    (words.count - 2).times do |word_idx|
      all[words[0]] << words[word_idx + 2][0..-2]
    end
  end
end

def saiki(answers, idx, all)
  all.each do |key, value|
    next if answers.include?(key)
    if value.include?(idx)
      answers << key
      saiki(answers, key, all)
    end
  end
end

answers = []
saiki(answers, shiny_gold_idx.to_s, all)
p answers.size