require_relative 'student'
require_relative 'book'
require_relative 'teacher'
require_relative 'rental'
require_relative 'app'
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

  def self.create_teacher
    puts "Teacher\'s name : "
    name = gets.chomp
    puts "Teacher\'s age: "
    age = gets.chomp
    puts "Teacher\'s specialization: "
    specialization = gets.chomp
    Teacher.new(age, name, specialization)
    puts "Teacher (#{name}) has been created successfully"
  end

  def self.create_book
    puts "Book\'s title: "
    title = gets.chomp
    puts "Book\'s author: "
    author = gets.chomp
    Book.new(title, author)
    puts "Book (#{title} By #{author}) has been created successfully"
  end

  def self.create_rental(books, people)
    if books.empty?
      puts 'Books list is empty, please create a book first'
    elsif people.empty?
      puts 'People list is empty, please create a person first'
    else
      puts 'Select a book from the following list by number'
      books.each_with_index do |book, index|
        puts "[Book #{index}] Title: #{book.title} | Author: #{book.author}"
      end
      book_number = gets.chomp.to_i
      puts 'Select a person from the following list by number'
      App.new.people_list
      person_number = gets.chomp.to_i
      puts 'Date: '
      date = gets.chomp
      Rental.new(date, people[person_number], books[book_number])
      puts "Rental on(#{date}) has been created successfully"
    end
  end
end
