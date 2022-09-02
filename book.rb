require_relative './rental'

class Book
  attr_reader :rentals
  attr_accessor :title, :author

  @@books = []
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    @@books << self
  end

  def add_rental(person, date)
    Rental.new(person: person, date: date, book: self)
  end
end
