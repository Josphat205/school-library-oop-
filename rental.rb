require 'time'

class Rental
  attr_accessor :date, :person, :book

  def initialize(_date, person, book)
    @date = DateTime.now.strftime('%Y/%m/%d')
    @person = person
    person.rentals << self
    @book = book
    book.rentals << self
  end
end
