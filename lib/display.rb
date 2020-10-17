def display_list(gift_list) # hash
  gift_list.each_with_index do |(item, purchased), index|
    # condition ? truthy : falsey
    x_mark = purchased ? "X" : " "
    puts "#{index + 1} - [#{x_mark}] #{item}"
  end
end
