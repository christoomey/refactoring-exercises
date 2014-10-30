class Parser
  def initialize(data)
    @data = data
  end

  def as_integer(attribute)
    @data[attribute].gsub(",", "").to_i
  end

  def as_pretty_string(attribute)
    @data[attribute].strip
  end

  def as_pretty_phone_number(attribute)
    messy_phone_number = @data[attribute]
    pattern = /(\d{2})?\(?(\d{3})\)?[-.]?(\d{3})[-.]?(\d{4})/
    match = pattern.match(messy_phone_number)
    "+#{match[1] || 1} (#{match[2]}) #{match[3]}-#{match[4]}"
  end
end
