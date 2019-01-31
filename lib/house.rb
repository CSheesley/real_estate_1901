class House
  attr_reader :price, :address, :rooms

  def initialize(price_arg, address_arg)
    @price = price_arg.slice!(0,(price_arg.length)).to_i
    # (better) substring method -> price_arg[1..-1].to_i
    @address = address_arg
    @rooms = []
  end

  def add_room(room_arg)
    @rooms << room_arg
  end

  def room_from_category(category_arg)
    @rooms.find_all do |room|
      room.category == category_arg
    end
  end

  def area
    raw_areas = []
    @rooms.each do |room|
      raw_areas << (room.length * room.width)
    end
    return raw_areas.sum
    # (better) now using map and room.area method
      # raw_area = @rooms.map do |room|
      #   room.area
      # end
      # raw_area.sum
  end

  def price_per_square_foot
    (@price.to_f / area).round(2)
  end

  def room_area(room_arg) #helper method
    room_arg.length * room_arg.width
  end

  def rooms_sorted_by_area
    rooms_by_area = @rooms.sort_by do |room|
      room_area(room)
      # (better) call the room area method -> room.area (now that this method is created)
      # @rooms_by_area = @rooms.sort_by do |room|
      #   room.area
      # end
    end
    return rooms_by_area.reverse

  end

  def rooms_by_category
    # categorized_rooms = Hash.new { |hash, key| hash[key] = [] }
      categorized_rooms = @rooms.group_by do |room|
      room.category
    end
  end

end
