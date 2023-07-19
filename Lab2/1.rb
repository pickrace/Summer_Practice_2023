module Validation
  # Максимальна довжина імені
  MAX_NAME_LENGTH = 40
  # Шаблон для валідності імені
  NAME_REGEX = /^[A-Za-z0-9-]{1,#{MAX_NAME_LENGTH}}$/
  # Шаблон для валідності номера ІПН
  INN_REGEX = /^[A-Z]{2}\d{10}$/

  # Метод перевіряє string-рядок на пустоту, перевищення довжини тексту
  # і валідацію відносно шаблону, який дозволяє лише літери та дефіси
  def self.valid_name?(string)
    return false if string.nil? || string.empty? || string.length > MAX_NAME_LENGTH

    string.match?(NAME_REGEX)
  end

  # Метод перевіряє string-рядок на пустоту і валідацію відносно шаблону,
  # який дозволяє 2 будь-які літери великого регістру і 10 цифр
  def self.valid_inn?(string)
    return false if string.nil? || string.empty?

    string.match?(INN_REGEX)
  end

  # Метод перевіряє чи не є дата нульовою і об'єктом типу date.
  # Також є перевірка, чи дата належить до минулого.
  # Рядок "date <= Date.today" повертає "true" в такому випадку
  def self.valid_date_format?(date)
    return false if date.nil? || !date.is_a?(Date)

    date <= Date.today
  end
end
