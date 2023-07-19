require_relative "Person"
require_relative "PersonRepository"
require_relative "ConsoleInput"
require_relative "1"
require 'date'
#підключення класів та модулів

include ConsoleInput

#cтворюємо репозиторій
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

  #Навігація по репозиторію для зручності й перевірки
  case choice
  when 1 # Додавання персони до репозиторію
    first_name = get_input("Enter First Name")
    last_name = get_input("Enter Last Name")
    inn = get_input("Enter INN")
    date_of_birth = get_input("Enter Date of Birth (YYYY-MM-DD)")

    begin
      person = Person.new(first_name, last_name, inn, date_of_birth)
      repository.add_person(person)
      puts "Person added successfully!"
    rescue ArgumentError => e
      puts "Error: #{e.message}"
    end

  when 2 # Видалення персони з репозиторію за іменем
    name = get_input("Enter Name to remove")
    person = repository.find_by_name(name)
    if person
      repository.remove_person(person)
      puts "Person removed successfully!"
    else
      puts "Person not found!"
    end

  when 3 # Пошук персони з репозиторію за іменем
    name = get_input("Enter Name to find")
    person = repository.find_by_name(name)
    puts person ? person : "Person not found!"

  when 4 # Пошук персони з репозиторію за ІПН
    inn = get_input("Enter INN to find")
    person = repository.find_by_inn(inn)
    puts person ? person : "Person not found!"

  when 5 # Пошук персони з репозиторію за датою народження
    date_of_birth = get_date_input
    person = repository.find_by_date_of_birth(date_of_birth)
    puts person ? person : "Person not found!"

  when 6 # Вивід всіх персн у репозиторію
    puts "All People:"
    repository.people.each { |person| puts person }

  when 7 # Вихід з циклу навігації й завершення роботи
    break
  else
    puts "Invalid choice!" #Введена невірна цифра навігації
  end

  puts "\n"
end
