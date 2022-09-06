require_relative 'app'
class Lister
  def self.get_books(books)
    puts '-' * 50
    if books.empty?
      puts 'The books list is empty'
    else
      puts 'Books list:'
      books.each_with_index do |book, index|
        puts "[Book #{index}] Title: #{book.title} | Author: #{book.author}"
      end
    end
  end

  def self.get_rental(people)
    puts "Person\'s ID: "
    input_id = gets.chomp.to_i
    selected_person = people.select { |person| person.id = input_id }
    selected_person[0].rentals.each do |rental|
      puts "Date: #{rental.date} | Book: #{rental.book.title} By #{rental.book.author}"
    end
  end

  def self.get_people(_people)
    puts '-' * 50
    if @people.empty?
      puts 'The list is empty'
    else
      puts 'People list:'
      App.new.people_list
    end
  end
end
