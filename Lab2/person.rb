require_relative "consoleInput"

#Клас Person представляє особу з атрибутами first_name, last_name, inn, birth_date.
class Person
  include ConsoleInput

  #Аксесори змінних first_name, last_name, inn, birth_date
  attr_accessor :first_name, :last_name, :inn, :birth_date

  #конструктор для створення об'єкту Person
  def initialize(first_name, last_name, inn, birth_date)
    @first_name = first_name
    @last_name = last_name
    @inn = inn
    @birth_date = birth_date
  end

  # Представлення об'єкту Person у зрозумілому форматі рядка.
  def to_s
    "#{@first_name} #{@last_name}, INN: #{@inn}, Date of Birth: #{@birth_date}"
  end
end
