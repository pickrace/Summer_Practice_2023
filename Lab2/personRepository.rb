require_relative "person"

class PersonRepository
  # Клас PersonRepository містить список people для збереження об'єктів Person.
  attr_reader :people

  def initialize
    @people = []
  end

  # Метод для додавання особи до репозиторію.
  def add_person(person)
    if person.is_a?(Person)
      existing_person = @people.find { |p| p.inn == person.inn }
      if existing_person
        raise "Person with INN #{person.inn} already exists."
      else
        @people << person
      end
    else
      raise ArgumentError, "Person must be an instance of the Person class"
    end
  end

  # Метод для видалення особи з репозиторію.
  def remove_person(person)
    @people.delete(person)
  end

  # Метод для пошуку особи за іменем або прізвищем.
  def find_by_name(name)
    @people.find { |person| person.first_name == name || person.last_name == name }
  end

  # Метод для пошуку особи за ІПН.
  def find_by_inn(inn)
    @people.find { |person| person.inn == inn }
  end

  # Метод для пошуку особи за датою народження.
  def find_by_date_of_birth(date)
    @people.find { |person| person.birth_date == date }
  end
end
