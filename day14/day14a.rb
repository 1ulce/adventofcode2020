f = File.open("day14_input")
s = f.read  # 全て読み込む
f.close
lines = s.split("\n")
mask_0 = []
mask_1 = []
store = {}
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
    store_num = line.match(/\[.*\]/).to_s[1..-2]
    value = line.match(/=.*/).to_s[2..-1].to_i.to_s(2)
    value = "0" * (36 - value.size) + value
    masked_value = value.dup
    value.chars.size.times do |idx|
      masked_value[(-1 - idx)] = "0" if mask_0.include?(idx)
      masked_value[(-1 - idx)] = "1" if mask_1.include?(idx)
    end
    # p value
    # p "↓"
    # p masked_value
    value = Integer("0b"+ masked_value)
    store[store_num] = value
  end
  # p store
end
p store.values.sum
