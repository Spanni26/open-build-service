# frozen_string_literal: true

class FuzzyTimeComponent < ApplicationComponent
  attr_reader :time

  def initialize(time:)
    super
    @time = time.utc
  end

  def human_time_ago
    now = Time.now.utc
    diff = now - time

    if diff.positive?
      "#{distance_of_time_in_words(now, time)} ago"
    else
      "in #{distance_of_time_in_words(now, time)}"
    end
  end
end
