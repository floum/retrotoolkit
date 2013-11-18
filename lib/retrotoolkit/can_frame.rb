class CanFrame

  def initialize value
    @value = value
  end

  def to_bits
    "%0#{@value.size * 4}d" % (@value.hex.to_s(2))
  end

  def to_hex
    @value
  end

  def dlc
    @value[3].hex
  end

  def identifier
    @value[0..2]
  end

  def data_field
    @value[4..-5]
  end

  def crc
    @value[-4..-1]
  end

  def repr
    to_bits
  end

  def match integer
    data_field_values.select { |value| value.hex == integer }.size > 0
  end

  def formatted_output
    [identifier, dlc, data_field_bytes.join(' '), crc].join ' '
  end

#######################################################################
  private  
######################################################################

  def data_field_bytes
    data_field.scan(/.{2}/)
  end

  def data_field_values
    values = []
    dlc.times do |length|
      (dlc-length).times do |pos|
        values << data_field[(pos*2)..(pos*2+1+length*2)]
      end
    end
    values
  end

end
