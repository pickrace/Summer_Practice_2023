module ConsoleInput
  def get_input(message)
    print "#{message}: "
    gets.chomp
  end

  # на всіх валідаціях є зупинка програми з відповідним меседжем для користувача

  def valid_name?(name) # валідація імені та прізвища
    if Validation.valid_name?(name)
      true
    else
      abort("Invalid name format. Name should contain only letters, digits, and hyphens.")
    end
  end

  def valid_inn?(inn) # валідація ІПН
    if Validation.valid_inn?(inn)
      true
    else
      abort("Invalid INN format. INN should start with two uppercase letters followed by ten digits.")
    end
  end

  def valid_date_format?(input) # валідація дати
    if /^\d{4}-\d{2}-\d{2}$/.match?(input) && Date.parse(input)
      true
    else
      abort("Invalid date format. Date should be in the format YYYY-MM-DD.")
    end
  rescue ArgumentError
    abort("Invalid date. Please enter a valid date in the format YYYY-MM-DD.")
  end

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
