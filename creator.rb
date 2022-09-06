require_relative 'student'
require_relative 'book'

class Creator
  def self.create_student
    puts "Student\'s name : "
    name = gets.chomp
    puts "Student\'s age: "
    age = gets.chomp
    puts "Student\'s classroom: "
    classroom = gets.chomp
    puts "Has parent\'s persmission? [Y/N]: "
    parent_permission = gets.chomp
    true if parent_permission == ('y' || 'Y')
    false if parent_permission == ('n' || 'N')
    Student.new(age, name, classroom)
    puts "Student (#{name}) has been created successfully"
  end

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
end