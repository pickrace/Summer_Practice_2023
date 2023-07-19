require_relative "person"
require_relative "personRepository"
require 'date'
include ConsoleInput

repository = PersonRepository.new

loop do
  puts "1. Add Person"
  puts "2. Remove Person"
  puts "3. Find Person by Name"
  puts "4. Find Person by INN"
  puts "5. Find Person by Date of Birth"
  puts "6. Print All People"
  puts "7. Exit"
  print "Enter your choice: "
  choice = gets.chomp.to_i

  case choice
  when 1
    first_name = get_input("Enter First Name")
    last_name = get_input("Enter Last Name")
    inn = get_input("Enter INN")
    date_of_birth = Date.parse(get_input("Enter Date of Birth (YYYY-MM-DD)"))
    person = Person.new(first_name, last_name, inn, date_of_birth)
    repository.add_person(person)
    puts "Person added successfully!"
  when 2
    name = get_input("Enter Name to remove")
    person = repository.find_by_name(name)
    if person
      repository.remove_person(person)
      puts "Person removed successfully!"
    else
      puts "Person not found!"
    end
  when 3
    name = get_input("Enter Name to find")
    person = repository.find_by_name(name)
    puts person ? person : "Person not found!"
  when 4
    inn = get_input("Enter INN to find")
    person = repository.find_by_inn(inn)
    puts person ? person : "Person not found!"
  when 5
    date_of_birth = Date.parse(get_input("Enter Date of Birth (YYYY-MM-DD) to find"))
    person = repository.find_by_date_of_birth(date_of_birth)
    puts person ? person : "Person not found!"
  when 6
    puts "All People:"
    repository.people.each { |person| puts person }
  when 7
    break
  else
    puts "Invalid choice!"
  end

  puts "\n"
end
