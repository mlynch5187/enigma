module Generator

  def todays_date
    Time.now.strftime("%d%m%y")
  end

  def letter_set
    ("a".."z").to_a << " "
  end

  def encode
    four_digit_number = (rand() * 10000).round(0)
    four_digit_number.to_s.rjust(5, '0')
  end
end
