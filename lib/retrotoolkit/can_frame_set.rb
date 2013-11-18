class CanFrameSet

  attr_reader :frames

  def initialize frames
    @frames = frames
  end

  def identifiers
    identifiers = []
    @frames.each do |f|
      identifiers << f.identifier unless identifiers.include?(f.identifier)
    end
    identifiers
  end

  def find_by_identifier identifier
    @frames.select { |f| f.identifier == identifier }
  end

  def find_by_value value
    @frames.select { |f| f.match(value) }
  end

  def match_identifier_with_value id, value
    find_by_value(value) & find_by_identifier(id)
  end

  def formatted_output
    @frames.map { |f| f.formatted_output }.join("\n")
  end

  def write file
    File.open file, 'w' do |f|
      f.write formatted_output
    end  
  end

end
