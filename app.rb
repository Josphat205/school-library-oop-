require_relative 'teacher'
require_relative 'rental'
require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'creator'
require_relative 'lister'
require 'pry'

class App
  def initialize
    @books = Book.class_variable_get(:@@books)
    @people = Person.class_variable_get(:@@people)
  end

  def people_list
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
    Lister.get_books(@books)
  end

  def list_people
    Lister.get_people(@people)
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
    Creator.create_teacher
  end

  def create_book
    Creator.create_book
  end

  def create_rental
    Creator.create_rental(@books, @people)
  end

  def list_rentals
    Lister.get_rental(@people)
  end
end
