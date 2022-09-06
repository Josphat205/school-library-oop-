require_relative 'app'
require 'pry'
def main
  app = App.new
  app.execute
end

def list_of_options
  puts '-' * 50
  puts '
      1- List all books
      2- List all people
      3- Create a new person
      4- Create a new book entry
      5- Create a new rental entry
      6- List all rentals for a given person id
      7- Quit'
  puts 'Choose an option: '
end

def operation(input)
  case input
  when 1
    list_books
  when 2
    list_people
  when 3
    create_person
  when 4
    create_book
  when 5
    create_rental
  when 6
    list_rentals
  else
    puts 'Please choose a valid option number'
  end
end

main
