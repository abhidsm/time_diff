require 'rubygems'
require 'active_support/all'
module TimeDiff
  def diff(start_date, end_date)
    from_time = start_date.to_time if start_date.respond_to?(:to_time)
    to_time = end_date.to_time if end_date.respond_to?(:to_time)
    distance_in_seconds = ((to_time - from_time).abs).round
    components = []

    %w(year month week day hour minute second).each do |interval|
        delta = (distance_in_seconds / 1.send(interval)).floor
        distance_in_seconds -= delta.send(interval)
        components << pluralize(delta, interval)
    end
    return components
  end
  
  def pluralize(value, text)
    result = value > 1 ? text.pluralize : text
    return "#{value} #{result}"
  end
end
