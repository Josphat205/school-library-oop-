require_relative './nameable'
require_relative './decorator'
require_relative './rental'
class Person
  attr_accessor :name, :age, :rentals, :classroom, :id

  @@people = []
  def initialize(age, name, classroom, parent_permission: true)
    super()
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    @@people << self
    @classroom = classroom
  end

  def add_rental(book)
    Rental.new(person: self, book: book)
  end

  def can_use_services?
    @age >= 18 || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end

# person = Person.new(30, 'loman')
# puts person.correct_name
# capitalizedPerson = CapitalizeDecorator.new(person)
# puts capitalizedPerson.correct_name
# capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
# puts capitalizedTrimmedPerson.correct_name
