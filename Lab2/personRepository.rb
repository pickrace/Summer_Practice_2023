require_relative "Person"
require_relative "1"
require 'date'

class PersonRepository
  attr_reader :people

  def initialize # Ініціалізація списку
    @people = []
  end

  def add_person(person)  # Функціонал додавання персони в репозиторій. Перевірка на існуючу особу в репозиторії.
    if person.is_a?(Person)
      existing_person = @people.find { |p| p.inn == person.inn }
      if existing_person
        raise "Person with INN #{person.inn} already exists." # Якщо існує - повідомляємо про це
      else
        @people << person # Якщо ще не існує -> додаємо в список
      end
    else
      raise ArgumentError, "Person must be an instance of the Person class" # Персона має бути екземпляром класу Person
    end
  end

  def remove_person(person) # Видалення персони
    @people.delete(person)
  end

  def find_by_name(name)
    @people.find { |person| person.first_name == name || person.last_name == name } # Пошук по імені
  end

  def find_by_inn(inn)
    @people.find { |person| person.inn == inn } # Пошук по ІПН
  end

  def find_by_date_of_birth(date)
    @people.find { |person| person.birth_date == date } # Пошук по даті народження
  end
end
