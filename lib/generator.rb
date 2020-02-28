class Generator
  attr_reader :letter_set, :a_key, :b_key, :c_key, :d_key

  def initialize()
    @a_key = []
    @b_key = []
    @c_key = []
    @d_key = []
    @letter_set = ("a".."z").to_a << " "
  end

  def generate_keys
    (1..9).to_a.sample(5)
  end

  def split_keys
    generated_keys = generate_keys

    @a_key << generated_keys[0..1]
    @b_key << generated_keys[1..2]
    @c_key << generated_keys[2..3]
    @d_key << generated_keys[3..4]
  end
end
