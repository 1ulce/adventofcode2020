f = File.open("day13_input")
s = f.read  # 全て読み込む
f.close
lines = s.split("\n")
now = lines[0].to_i 
earliest = 0
wait = 1000000
lines[1].split(",").each do |num|
  if num == "x"
  else
    num = num.to_i
    tmp_wait = num - now % num
    if tmp_wait < wait
      wait = tmp_wait
      earliest = num
    end
  end
end
p wait * earliest