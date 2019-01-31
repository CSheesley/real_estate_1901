require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/room'
require './lib/house'

class HouseTest < Minitest::Test

  def test_that_the_house_exists
    house = House.new("$400000", "123 sugar lane")

    assert_instance_of House, house
  end

  def test_the_house_has_a_price_string_converted_to_integer
    house = House.new("400000", "123 sugar lane")

    assert_equal 400_000, house.price
  end

  def test_that_the_house_has_an_address
    house = House.new("400000", "123 sugar lane")

    assert_equal "123 sugar lane", house.address
  end

  def test_that_rooms_list_in_house_starts_empty
    house = House.new("400000", "123 sugar lane")

    assert_equal [], house.rooms
  end

  def test_that_rooms_can_be_added_to_the_list_of_rooms
    house = House.new("400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)

    house.add_room(room_1)
    house.add_room(room_2)

    assert_equal [room_1, room_2], house.rooms
  end

  def test_that_rooms_can_be_listed_by_category
    house = House.new("400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)

    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    assert_equal [room_1, room_2], house.room_from_category(:bedroom)
    assert_equal [room_4], house.room_from_category(:basement)
  end

  def test_that_total_area_of_the_house_can_be_calculated
    house = House.new("400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)

    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    assert_equal 1900, house.area
  end

  def test_that_price_per_square_foot_can_be_calculated
    house = House.new("400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)

    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    assert_equal 210.53, house.price_per_square_foot
  end

  def test_that_rooms_in_house_can_be_sorted_by_area
    house = House.new("400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)

    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    assert_equal [room_4, room_3, room_2, room_1], house.rooms_sorted_by_area
  end

  def test_that_rooms_can_be_grouped_by_category
    house = House.new("400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)

    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    expected = {
      bedroom: [room_1, room_2],
      living_room: [room_3],
      basement: [room_4]
    }

    assert_equal expected, house.rooms_by_category
    # Original syntax error with expected value - fix -> use ()'s when asserting a hash.
    # Better syntax now written encapsulating hash in an 'expected' variable.
  end

end
