require_relative('../models/student.rb')
require_relative('../models/house.rb')
require('pry')

house1 = House.new({
  "name" => "Gryffindor"
  "logo" => "http://bit.ly/2zxGdiB"
  })

house1.save()

student_1 = Student.new({
  "first_name" => "Harry",
  "last_name" => "Potter",
  "house_id" => house1.id,
  "age" => 14
  })

student_1.save()

binding.pry
nil
