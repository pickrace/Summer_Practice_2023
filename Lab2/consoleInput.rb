
module ConsoleInput
  # Метод для отримання введення з консолі з певним повідомленням.
  def get_input(message)
    print "#{message}: "
    gets.chomp
  end

  # Валідація для імені
  def valid_name?(name)
    true
  end

  # Валідація для ІПН
  def valid_inn?(inn)
    true
  end

  # Валідація формату дати (yyyy-mm-dd) та перевірка на коректність дати.
  def valid_date_format?(input)
    /^\d{4}-\d{2}-\d{2}$/.match?(input) && Date.parse(input)
  rescue ArgumentError
    false
  end

  # Метод для отримання дати з консолі в форматі yyyy-mm-dd.
  def get_date_input
    input = nil
    until input && valid_date_format?(input)
      print "Input valid date value in yyyy-mm-dd format: "
      input = gets.chomp
    end
    Date.parse(input)
  end

  private :valid_date_format?
end
