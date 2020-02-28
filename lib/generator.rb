class Generator

  def initialize()
    @random_keys = []
  end

  def generate_keys
    (1..9).to_a.sample(5)
  #   5.times do
  #     @random_keys << rand(1...9)
  #   end
  #   @random_keys
  # end
end
