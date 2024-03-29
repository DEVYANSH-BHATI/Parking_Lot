module Human_time

  def self.seconds_to_string(s)

    # d = days, h = hours, m = minutes, s = seconds
    m = (s / 60).floor
    s = s % 60
    h = (m / 60).floor
    m = m % 60
    d = (h / 24).floor
    h = h % 24

    output = "#{s.floor} second#{Human_time.pluralize(s)}" if (s > 0)
    output = "#{m} minute#{Human_time.pluralize(m)}, #{s.floor} second#{Human_time.pluralize(s)}" if (m > 0)
    output = "#{h} hour#{Human_time.pluralize(h)}, #{m} minute#{Human_time.pluralize(m)}, #{s.floor} second#{Human_time.pluralize(s)}" if (h > 0)
    output = "#{d} day#{Human_time.pluralize(d)}, #{h} hour#{Human_time.pluralize(h)}, #{m} minute#{Human_time.pluralize(m)}, #{s.floor} second#{Human_time.pluralize(s)}" if (d > 0)

    return output
  end

  def self.pluralize number
    return "s" unless number == 1
    return ""
  end

end