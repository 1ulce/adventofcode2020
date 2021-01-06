f = File.open("day14_input")
s = f.read  # 全て読み込む
f.close
lines = s.split("\n")
mask_0 = []
mask_1 = []
store = {}

def calc_store(masked, value, store)
  #p masked
  if masked.include?("X")
    idx = masked.index("X")
    masked[idx] = "0"
    calc_store(masked, value, store)
    masked[idx] = "1"
    calc_store(masked, value, store)
    masked[idx] = "X"
  else
    store_num = Integer("0b"+ masked)
    store[store_num] = value.to_i
  end
end

lines.each do |line|
  case line[0..2]
  when "mas"
    mask_0 = []
    mask_1 = []
    line[-36..-1].chars.reverse.each_with_index do |c, idx|
      case c
      when "0"
        mask_0 << idx
      when "1"
        mask_1 << idx
      end
    end
    # p mask_0
    # p mask_1
  when "mem"
    store_num = line.match(/\[.*\]/).to_s[1..-2].to_i.to_s(2)
    value = line.match(/=.*/).to_s[2..-1]
    store_num = "0" * (36 - store_num.size) + store_num
    masked_store_num = store_num.dup
    store_num.chars.size.times do |idx|
      if mask_0.include?(idx)
      elsif mask_1.include?(idx)
        masked_store_num[(-1 - idx)] = "1" 
      else
        masked_store_num[(-1 - idx)] = "X"
      end
    end
    
    calc_store(masked_store_num, value, store)
  end
  #p store
end
p store.values.sum
