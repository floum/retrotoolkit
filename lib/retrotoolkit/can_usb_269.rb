class CanUsb269

  def self.load file
    data = file.read.gsub(/[^0-9A-Ft]/, '')
    frames = data.split 't'
    frames.shift
    frame_set = []
    frames.each do |frame|
      frame_set << CanFrame.new(frame)
    end
    CanFrameSet.new(frame_set)
  end
end
