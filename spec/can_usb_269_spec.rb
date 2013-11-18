require 'spec_helper.rb'

describe CanUsb269 do
  describe ".load file" do
    before :each do
      file = double 'file'
      allow(file).to receive(:read).and_return("?S6E0t45320011C4C2t2571AA1BF3?")
      @can_frame_set = CanUsb269.load file
    end
    it "returns a CanFrameSet" do
      expect(@can_frame_set).to be_a_kind_of(CanFrameSet)
    end
  end
end
