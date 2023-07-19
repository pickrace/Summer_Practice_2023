require_relative "ConsoleInput"

class Person
  include ConsoleInput

  attr_accessor :first_name, :last_name, :inn, :birth_date # Створення аксесорів для змінних

  def initialize(first_name, last_name, inn, birth_date) # ініціалізація і валідація даних
    @first_name = valid_name?(first_name)
    @last_name = valid_name?(last_name)
    @inn = valid_inn?(inn)
    @birth_date = valid_date_format?(birth_date)
  end

  def to_s  # зручне подання інформації для навігації
    "#{@first_name} #{@last_name}, INN: #{@inn}, Date of Birth: #{@birth_date}"
  end
end
