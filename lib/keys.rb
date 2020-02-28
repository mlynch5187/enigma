class Keys

  def initialize()
    @random_keys = []
  end

  def generate_keys
    5.times do
      @random_keys << rand(1...9)
    end
    @random_keys
  end
end
