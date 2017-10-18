require_relative('../models/student.rb')

student_1 = Student.new({
  "first_name" => "Harry",
  "last_name" => "Potter",
  "house" => "Gryffindor",
  "age" => 14
  })

student_1.save()
