require_relative './person'
class Student < Person
  attr_reader :classroom
  def initilize(age,name,classroom,parent_permission: true)
    super(age, name, parent_permission)
    self.classroom = (classroom)
  end
  def classroom=(class_room)
    @classroom = class_room
    class_room.students << self unless class_room.students.include?(self)
  end
  def play_hooky
    "¯\(ツ)/¯"
  end
end
