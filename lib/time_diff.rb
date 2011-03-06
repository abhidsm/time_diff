require 'rubygems'
require 'active_support/all'

class Time
  def self.diff(start_date, end_date)
    from_time = start_date.to_time if start_date.respond_to?(:to_time)
    to_time = end_date.to_time if end_date.respond_to?(:to_time)
    distance_in_seconds = ((to_time - from_time).abs).round
    components = []

    %w(year month week day hour minute second).each do |interval|
        delta = (distance_in_seconds / 1.send(interval)).floor
        distance_in_seconds -= delta.send(interval)
        components << delta
    end
    return {:year => components[0], :month => components[1], :week => components[2], :day => components[3], :hour => components[4], :minute => components[5], :second => components[6]}
  end
end
