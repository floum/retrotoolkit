require 'spec_helper'

describe CanFrameSet do

  before :each do
    can_frames = [ CanFrame.new('45320011C4C23'), CanFrame.new('2571AA1BF3') ]
    @can_frame_set = CanFrameSet.new can_frames

    @set_of_10_frames = build :can_frame_set
  end

  describe "#frames" do
    it "returns its set of frames" do
      expect(@can_frame_set.frames).to be_a_kind_of(Array)
    end
    it "is made of CanFrames" do
      expect(@can_frame_set.frames.select {|t| t.kind_of?(CanFrame) }).to match_array(@can_frame_set.frames)
    end
  end

  describe "#identifiers" do
    it "returns the array of the present identifiers" do
      expect(@can_frame_set.identifiers).to match_array(["453", "257"])
    end
  end

  describe "#find_by_identifier identifier" do
    it "returns the array of the frames with the matching identifier" do
      expect(@can_frame_set.find_by_identifier("257").size).to eq(1)
    end
  end

  describe "#find_by_value value" do
    it "returns the array of frames with a value matching the value" do
      expect(@can_frame_set.find_by_value(17).size).to eq(1)
    end
  end

  describe "#match_identifier_with_value id, value" do
    it "returns the matching frames with id and value" do
      expect(@can_frame_set.match_identifier_with_value("453", 17).size).to eq(1)
    end
  end

  describe "#write file" do
    it "writes the can frame set to file" do
      @set_of_10_frames.write 'set_of_10_frames'
      expect(File.open('set_of_10_frames').each_line.count).to eq(10)
    end
  end

  describe "#formatted_output" do
    it "has as many lines as its number of frames" do
      expect(@set_of_10_frames.formatted_output.lines.count).to eq(10)
    end
  end

  describe "#order_by_crc" do
    it "orders its frames by crc value" do
      pending
    end
  end

end
