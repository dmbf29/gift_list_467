require_relative 'scraper'
require_relative 'display'

# TODO: you can build your christmas list program here!
# Step 1 - The menu loop 🎁
# 0 - puts a welcome message to the user
# 1 - puts ask the user what action they'd like to do
# 2 - store their action in a variable
# 3 - direct the user to the correct action
# 4 - puts a TODO: message
# 5 - loop *until* the user chooses quit

# 'item' => boolean
gift_list = {
  'nintendo' => true,
  'playstation' => false
}

# Step 2 - Listing our gifts
# 0 -iterate over our gift list to display
# .each_with_index do |(key, value), index|
# 1 - Format the text
# # 1 - [ ] sockets
# # 2 - [X] ruby book
# # 3 - [ ] macbook pro

# Step 3 - Adding a new gift
# 0 - ask the user which item they would like to add
# 1 - gift = store the item in a variable
# 2 - add the gift to the gift_list
# C -> hash_name[new_key] = new_value
# 3 - puts a message 'gift was added to list'

# Step 4 - Deleting a gift
# 0 - display the list
# 1 - index = ask the user which item they'd like to delete
# 2 - gift = get the gift from the gift_list (.keys)
# 3 - remove the gift from the gift_list (.delete(gift))

# Step 5 - Marking a gift as purchased
# 0 - display the list
# 1 - index = ask the user which item they'd like to mark
# 2 - gift = get the gift from the gift_list (.keys)
# 3 - CRUD - Update -> change the value of the gift
# 4 - tell the user that gift was marked
# hash[key] = new_value


puts "🎁 --------------------------- 🎄"
puts " Welcome to your Christmas List "
puts "🤶 --------------------------- 🎅"

# start loop here
# until condition
action = 'start the loop plz and thx'
until action == 'quit'
  puts "Which action [list|add|mark|import|delete|quit]?"
  action = gets.chomp

  # case the_thing_we're_check_equality_on
  case action
  when 'list'
    display_list(gift_list)
  when 'add'
    puts "What item?"
    gift = gets.chomp
    gift_list[gift] = false
    puts "#{gift} was added to your list..."
  when 'delete'
    # 0 - display the list
    display_list(gift_list)
    # 1 - index = ask the user which item they'd like to delete
    puts "Which item to delete?"
    index = gets.chomp.to_i - 1
    # 2 - gift = get the gift from the gift_list (.keys)
    gifts = gift_list.keys
    gift = gifts[index]
    # 3 - remove the gift from the gift_list (.delete(gift))
    gift_list.delete(gift)
    # hash.delete(key)
    puts "#{gift} was removed from the list"
  when 'mark'
    # 0 - display the list
    display_list(gift_list)
    # 1 - index = ask the user which item they'd like to mark
    puts "Which item to mark?"
    index = gets.chomp.to_i - 1
    # 2 - gift = get the gift from the gift_list (.keys)
    gifts = gift_list.keys
    gift = gifts[index]
    # 3 - CRUD - Update -> change the value of the gift
    # p !gift_list[gift]
    gift_list[gift] = !gift_list[gift]
    # 4 - tell the user that gift was marked
    puts "#{gift} was updated..."
    # hash[key] = new_value
  when 'import'
    # ask user what they want to search for
    puts 'What would you like to search for?'
    keyword = gets.chomp
    # scrape the html for 5 names of gifts
    # have our scraper return a gift_hash
    etsy_list = scrape(keyword)
    display_list(etsy_list)
    # ask user which number to import
    puts "Which gift do you want to import?"
    index = gets.chomp.to_i - 1
    # get the keys of the gift hash from etsy
    gifts = etsy_list.keys
    # retrieve one gift name using the index
    gift = gifts[index]
    # add to the gift_list
    gift_list[gift] = false
    puts "#{gift} was added to your list..."
  when 'quit'
  else
    puts "We don't have that action..."
  end

end







#
