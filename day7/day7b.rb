f = File.open("day7_input")
s = f.read  # 全て読み込む
f.close
lines = s.split("\n")
# dull coral bags contain 5 drab gray bags, 2 dotted chartreuse bags.
# dotted black bags contain no other bags.
s.gsub!(/bags/, "bag")
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
  all[words[0]] = {count: nil, bags: []}
  unless words[2] == "no"
    ((words.count - 2)/2).times do |word_idx|
      words[word_idx * 2 + 2].to_i.times do
        all[words[0]][:bags] << words[word_idx * 2 + 3][0..-2]
      end
    end
  else
    all[words[0]][:count] = 0
  end
end

def saiki(idx, all)
  unless all[idx][:count]
    temp_count = 0
    all[idx][:bags].each do |bag|
      temp_count += saiki(bag, all)
    end
    all[idx][:count] = temp_count
  end
  return all[idx][:count] + 1
end

p saiki(shiny_gold_idx.to_s, all) - 1 