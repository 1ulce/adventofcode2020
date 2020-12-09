f = File.open("day8_input")
s = f.read  # 全て読み込む
f.close
lines = s.split("\n")
map = {}
lines.each_with_index do |line, idx|
  words = line.split(" ")
  info = {next: idx + 1, used: false, acc: 0}
  case words[0]
  when "acc"
    info[:acc] = words[1].to_i
  when "jmp"
    info[:next] = idx + words[1].to_i
  when "nop"
  end
  map[idx] = info
end

def saiki(answer, idx, map)
  return answer if map[idx][:used] == true
  map[idx][:used] = true
  answer += map[idx][:acc]
  saiki(answer, map[idx][:next], map)
end

answer = 0
p saiki(answer, 0, map)