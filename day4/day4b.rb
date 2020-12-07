f = File.open("day4_input")
s = f.read  # 全て読み込む
f.close
lines = s.split("\n")
person_idx = 0
passports = []
lines.each do |line|
  if line == ""
    person_idx += 1
  else
    passports[person_idx] = {} if passports[person_idx] == nil
    line.split(" ").each do |field|
      key, value = field.split(":")
      passports[person_idx][key] = value
    end
  end
end

answer = 0
fields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
passports.each do |passport|
  flag = true
  fields.each do |field|
    if passport.key?(field)
      case field
      when "byr"
        flag = false unless (1920..2002).include?(passport[field].to_i)
      when "iyr"
        flag = false unless (2010..2020).include?(passport[field].to_i)
      when "eyr"
        flag = false unless (2020..2030).include?(passport[field].to_i)
      when "hgt"
        if passport[field].include?("in")
          flag = false unless (59..76).include?(passport[field].to_i)
        elsif passport[field].include?("cm")
          flag = false unless (150..193).include?(passport[field].to_i)
        else
          flag = false
        end
      when "hcl"
        flag = false unless passport[field].match(/#\h{6}/)
      when "ecl"
        flag = false unless ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"].include?(passport[field])
      when "pid"
        flag = false unless passport[field].size == 9
      end
    else
      flag = false 
    end
  end
  answer += 1 if flag 
end
p answer