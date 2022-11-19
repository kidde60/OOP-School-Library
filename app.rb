require './person'
require './student'
require './teacher'
require './classroom'
require './book'
require './rental'

@book_list = []
@person_list = []
@rental_list = []

def message
  p 'WELCOME TO OOP SCHOOL LIBRARY APP'
  p 'Please Choose an option using a number.'
  p '1 - List all books'
  p '2 - List all people'
  p '3 - Create a person'
  p '4 - Create a book'
  p '5 - Create a rental'
  p '6 - List all rentals for a given person id.'
  p '7 - Exit'
end

def list_books()
  puts
  if @book_list.empty?
    print '\nPlease first add some book\n'
  else
    @book_list.each_with_index do |book, index|
      puts "[#{index + 1}] Title : #{book.title}, Author: #{book.author}"
    end
  end
end

def list_person(persons)
  persons.each do |person|
    p "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end
end

def create_student
  p 'Add Student'
  print('Name: ')
  name = gets.chomp
  print('Age: ')
  age = gets.chomp
  student = Student.new(name, age)
  @person_list.push(student)
  p 'Student created successfully\n'
end

def create_teacher
  puts 'Add Teacher'
  print('Name: ')
  name = gets.chomp
  print('Age: ')
  age = gets.chomp
  print('Specialization: ')
  specialization = gets.chomp
  teacher = Teacher.new(name, age, specialization)
  @person_list.push(teacher)
  p 'Teacher created successfully\n'
end

def add_book
  puts 'Add Book'
  print('Title: ')
  title = gets.chomp
  print('Author: ')
  author = gets.chomp
  book = Book.new(title, author)
  @book_list.push(book)
  p 'Book created successfully\n'
end

def create_rental
  p 'Select a book from the following list by number '
  puts 'No Book found, please Add a book  +' if @book_list.size.zero?
  @book_list.each_with_index do |book, index|
    puts "#{index}) Title: #{book.title}, Author: #{book.author}"
  end
  book_index = gets.chomp.to_i

  p 'Select a person from the following list by number (not id)'
  puts "\t\t+    No Person found, please Add a book  " if @person_list.size.zero?
  @person_list.each_with_index do |person, index|
    puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end
  person_index = gets.chomp.to_i

  p 'Date [YYYY-MM-DD] :'
  date = gets.chomp
  rental = Rental.new(date, @book_list[book_index], @person_list[person_index])
  @rental_list.push(rental)

  p "Rental created successfully\n"
end

def list_rental
  print 'Enter a person ID: '
  p_id = gets.chomp
  if @rental_list.empty?
    print 'Please add some rentals'
  elsif !@person_list.find { |person| person.id == p_id }
    puts "No rental found with ID: #{p_id}"
  else
    puts
    @rental_list.select do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}" if rental.person.id == p_id
    end
  end
end

def create_person()
  loop do
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number] :'
    choose = gets.chomp
    case choose.to_i
    when 1
      create_student
      break
    when 2
      create_teacher
      break
    end
    break unless choose.to_i == 1 || choose.to_i == 2
  end
end

@rep = 0
loop do
  message
  @rep = gets.chomp
  case @rep.to_i
  when 1
    list_books
  when 2
    list_person(@person_list)
  when 3
    create_person
  when 4
    add_book
  when 5
    create_rental
  when 6
    list_rental
  else
    puts 'Thanks for using This App!!!'
  end
  break unless @rep.to_i != 7
end
