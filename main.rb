require_relative 'app'
require 'pry'
def main
  app = App.new
  app.execute
end

main
