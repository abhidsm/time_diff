require 'helper'
require 'time'
include TimeDiff

class TestTimeDiff < Test::Unit::TestCase
  should "return the time differnce in displayable format" do
    assert_test_scenarios(Time.parse('2011-03-06'), Time.parse('2011-03-07'), ["0 year", "0 month", "0 week", "1 day", "0 hour", "0 minute", "0 second"])
    assert_test_scenarios(Time.parse('2011-03-06'), Time.parse('2011-04-08'), ["0 year", "1 month", "0 week", "3 days", "0 hour", "0 minute", "0 second"])
    assert_test_scenarios(Time.parse('2011-03-06 12:30:00'), Time.parse('2011-03-07 12:30:30'), ["0 year", "0 month", "0 week", "1 day", "0 hour", "0 minute", "30 seconds"])
    assert_test_scenarios(Time.parse('2011-03-06'), Time.parse('2013-03-07'), ["2 years", "0 month", "0 week", "1 day", "12 hours", "0 minute", "0 second"])
    assert_test_scenarios(Time.parse('2011-03-06'), Time.parse('2011-03-14'), ["0 year", "0 month", "1 week", "1 day", "0 hour", "0 minute", "0 second"])
  end

  def assert_test_scenarios(start_date, end_date, expected_result)
    date_diff = diff(start_date, end_date)
    assert_equal(date_diff, expected_result)
  end
end
