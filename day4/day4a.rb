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
    flag = false unless passport.key?(field)
  end
  answer += 1 if flag 
end
p answer