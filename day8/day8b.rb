f = File.open("day8_input")
s = f.read  # 全て読み込む
f.close
lines = s.split("\n")
map = {}
lines.each_with_index do |line, idx|
  words = line.split(" ")
  info = {nop: false, next: idx + 1, used: false, acc: 0}
  case words[0]
  when "acc"
    info[:acc] = words[1].to_i
  when "jmp"
    info[:next] = idx + words[1].to_i
  when "nop"
    info[:nop] = true 
    if words[1].to_i == 0
      info[:next] = idx + 1
    else
      info[:next] = idx + words[1].to_i
    end
  end
  map[idx] = info
end

def saiki(answer, idx, map, ashiato)
  begin 
    return answer if map[idx][:used] == true
  rescue => e
    p answer
    return true
  end
  map[idx][:used] = true
  ashiato << idx
  answer += map[idx][:acc]
  next_idx = map[idx][:next]
  next_idx = idx + 1 if map[idx][:nop]
  saiki(answer, next_idx, map, ashiato)
end

ashiato = []
answer = 0
answer = saiki(answer, 0, map, ashiato)

original_ashiato = ashiato.dup
original_answer = answer
original_ashiato.reverse.each_with_index do |step, idx|
  if map[step][:acc] == 0
    original_ashiato.pop
    map[step][:nop] = map[step][:nop] == false
    map[step][:used] = false
    ashiato = original_ashiato.dup
    answer = original_answer
    result = saiki(answer, step, map, ashiato)
    original_answer = answer
    return original_answer if result == true
    ashiato = original_ashiato.dup
    map[step][:nop] = map[step][:nop] == true
  else
    original_answer -= map[step][:acc]
    map[step][:used] = false
    original_ashiato.pop
  end
end