require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/room'

class RoomTest < Minitest::Test

  def test_that_the_room_exists
    room = Room.new(:bedroom, 10, 13)

    assert_instance_of Room, room
  end

  def test_that_the_room_has_a_category
    room = Room.new(:bedroom, 10, 13)

    assert_equal :bedroom, room.category
  end

  def test_it_can_calculate_are
    room = Room.new(:bedroom, 10, 13)

    assert_equal 130, room.area
  end

  def test_that_the_room_has_length_and_width_measurements
    room = Room.new(:bedroom, 10, 13)

    assert_equal 10, room.length
    assert_equal 13, room.width
  end

end
