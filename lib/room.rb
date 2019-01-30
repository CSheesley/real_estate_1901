class Room
  attr_reader :category, :length, :width

  def initialize(category_arg, length_arg, width_arg)
    @category = category_arg
    @length = length_arg
    @width = width_arg
  end

end
