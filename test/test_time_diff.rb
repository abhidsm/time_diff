require 'helper'
require 'time'

class TestTimeDiff < Test::Unit::TestCase
  should "return the time differnce in displayable format" do
    assert_test_scenarios(Time.parse('2011-03-06'), Time.parse('2011-03-07'), {:year => 0, :month => 0, :week => 0, :day => 1, :hour => 0, :minute => 0, :second => 0})
    assert_test_scenarios(Time.parse('2011-03-06'), Time.parse('2011-04-08'), {:year => 0, :month => 1, :week => 0, :day => 3, :hour => 0, :minute => 0, :second => 0})
    assert_test_scenarios(Time.parse('2011-03-06 12:30:00'), Time.parse('2011-03-07 12:30:30'), {:year => 0, :month => 0, :week => 0, :day => 1, :hour => 0, :minute => 0, :second => 30})
    assert_test_scenarios(Time.parse('2011-03-06'), Time.parse('2013-03-07'), {:year => 2, :month => 0, :week => 0, :day => 1, :hour => 12, :minute => 0, :second => 0})
    assert_test_scenarios(Time.parse('2011-03-06'), Time.parse('2011-03-14'), {:year => 0, :month => 0, :week => 1, :day => 1, :hour => 0, :minute => 0, :second => 0})
  end

  def assert_test_scenarios(start_date, end_date, expected_result)
    date_diff = Time.diff(start_date, end_date)
    assert_equal(date_diff, expected_result)
  end
end
