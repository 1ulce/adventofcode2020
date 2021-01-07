input = "0,14,6,20,1,4"
array = input.split(",").map{|n|n.to_i}
map = {}
30000000.times do |n|
  unless array[n].nil?
    map[array[n]] = [n,n]
  else
    answer = map[array[n-1]][1] - map[array[n-1]][0]
    array << answer
    unless map[answer].nil?
      map[answer][0] = map[answer][1]
      map[answer][1] = n
    else
      map[answer] = [n,n]
    end
  end
end
p array.last