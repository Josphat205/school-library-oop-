require_relative 'teacher'
require_relative 'rental'
require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'creator'
require 'pry'

class App
  def initialize
    @books = Book.class_variable_get(:@@books)
    @people = Person.class_variable_get(:@@people)
  end

  def execute
    puts 'Welcome to Our Library'
    loop do
      list_of_options
      input = gets.chomp.to_i
      break if input == 7
      operation(input)
    end
  end

  def list_books
    Creator.get_books(@books)
  end

  def list_people
    puts '-' * 50
    if @people.empty?
      puts 'The list is empty'
    else
      puts 'People list:'
      @people.each_with_index do |person, index|
        if person.is_a?(Teacher)
          puts "[Teacher #{index}] ID: #{person.id}
          | Name: #{person.name} | Age: #{person.age} "
        end
        if person.is_a?(Student)
          puts "[Student #{index}] ID: #{person.id}
          | Age: #{person.age} | Name: #{person.name} | Classroom #{person.classroom}"
        end
      end
    end
  end

  def create_person
    puts '-' * 50
    puts 'Do you want to create a student (1) or a teacher (2)? [input the number]: '
    input = gets.chomp.to_i
    case input
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Please input a valid number'
    end
  end

  def create_student
    Creator.create_student
  end

  def create_teacher
    puts "Teacher\'s name : "
    name = gets.chomp
    puts "Teacher\'s age: "
    age = gets.chomp
    puts "Teacher\'s specialization: "
    specialization = gets.chomp
    Teacher.new(age, name, specialization)
    puts "Teacher (#{name}) has been created successfully"
  end

  def create_book
    puts "Book\'s title: "
    title = gets.chomp
    puts "Book\'s author: "
    author = gets.chomp
    Book.new(title, author)
    puts "Book (#{title} By #{author}) has been created successfully"
  end

  def create_rental
    books = Book.class_variable_get(:@@books)
    people = Person.class_variable_get(:@@people)
    if books.empty?
      puts 'Books list is empty, please create a book first'
    elsif people.empty?
      puts 'People list is empty, please create a person first'
    else
      puts 'Select a book from the following list by number'
      list_books
      book_number = gets.chomp.to_i
      puts 'Select a person from the following list by number'
      list_people
      person_number = gets.chomp.to_i
      puts 'Date: '
      date = gets.chomp
      Rental.new(date, people[person_number], books[book_number])
      puts "Rental on(#{date}) has been created successfully"
    end
  end

  def list_rentals
    people = Person.class_variable_get(:@@people)
    puts "Person\'s ID: "
    input_id = gets.chomp.to_i
    selected_person = people.select { |person| person.id = input_id }
    selected_person[0].rentals.each do |rental|
      puts "Date: #{rental.date} | Book: #{rental.book.title} By #{rental.book.author}"
    end
  end
end
