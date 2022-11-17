require_relative 'capitalize'
require_relative 'trimmer'
require './person'
require './student'
require './classroom'
require './rental'
require './book'

person = Person.new(22, 'maximilianus')
person.correct_name

capitalized_person = CapitalizeDecorator.new(person)
capitalized_person.correct_name

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
capitalized_trimmed_person.correct_name

# Testing has many/Belong to of classroom and student
student1 = Student.new('Joseph')
student2 = Student.new('Moses')
classroom1 = Classroom.new('32A')

classroom1.add_student(student1)
classroom1.add_student(student2)
student3 = Student.new('Precious')
student4 = Student.new('Wajja')
classroom2 = Classroom.new('F34')

student3.classroom = classroom2
student4.classroom = classroom2
# Testing many to many of person book and rental.

person = Person.new(23, 'Scovia')

book1 = Book.new('They live among us', 'James Walter')
book2 = Book.new('Think like a billionior', 'Trump')

p person.rentals.count

p book1.rentals.count
p book2.rentals.count
