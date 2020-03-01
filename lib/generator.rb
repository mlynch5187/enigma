require 'date'

module Generator

  def generate_sample
    (1..9).to_a.sample(5, "0")
  end
end
