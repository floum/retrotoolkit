require 'spec_helper'

describe CanFrame do
  describe "#to_bits" do
    it "given '0x3488007A' returns '00110100100010000000000001111010'" do
      frame = build :can_frame, value: '3488007A'
      expect(frame.to_bits).to eq('00110100100010000000000001111010')
    end
    it "comes with leading zeros" do
      frame = build :can_frame, value: '03'
      expect(frame.to_bits).to eq('00000011')
    end
  end

  describe "42D20083BC74" do
    before :each do 
      @frame = build :can_frame, value: '42D20083BC74'
    end
    it "has a sequence of bits (to_bits) equal to '010000101101001000000000100000111011110001110100'" do
      expect(@frame.to_bits).to eq ('010000101101001000000000100000111011110001110100')
    end
    it "has an identifier equal to '42D'" do
      expect(@frame.identifier).to eq('42D')
    end
    it "has a data length code (dlc) equal to 2" do
      expect(@frame.dlc).to eq(2)
    end
    it "has a data field equal to 0083" do
      expect(@frame.data_field).to eq('0083')
    end
    it "has a crc equal to 'BC74'" do
      expect(@frame.crc).to eq('BC74')
    end
    it "has a to_hex value equal to '42D20083BC74'" do
      expect(@frame.to_hex).to eq('42D20083BC74')
    end
    it "matches 0" do
      expect(@frame).to match(0)
    end
    it "matches 131" do
      expect(@frame).to match(131)
    end
    it "doesn't match 132" do
      expect(@frame).not_to match(132) 
    end
    it "has a formatted_output equal to '42D 2 00 83 BC74'" do
      expect(@frame.formatted_output).to eq('42D 2 00 83 BC74')
    end
    it "has a crc equal to 'BC74'" do
      expect(@frame.crc).to eq('BC74')
    end
  end

  describe "40D816202D6455B0B0E19350" do
    before :each do
      @frame = build :can_frame, value: '40D816202D6455B0B0E19350'
    end
    it "has an identifier equal do '40D'" do
      expect(@frame.identifier).to eq('40D')
    end
    it "has a data length code equal to 8" do
      expect(@frame.dlc).to eq(8)
    end
    it "has a data field equal to '16202D6455B0B0E1'" do
      expect(@frame.data_field).to eq('16202D6455B0B0E1')
    end
    it "matches 32 (0x20)" do
      expect(@frame).to match(32)
    end
    it "matches 5664 (0x1620)" do
      expect(@frame).to match(5664)
    end
    it "matches 1594324177046778081 (0x16202D6455B0B0E1)" do
      expect(@frame).to match(1594324177046778081)
    end
    it "matches 2974805 (0x2D6455)"  do
      expect(@frame).to match(2974805)
    end
    it "has a formatted output equal to '40D 8 16 20 2D 64 55 B0 B0 E1 9350'" do
      expect(@frame.formatted_output).to eq('40D 8 16 20 2D 64 55 B0 B0 E1 9350')
    end
    it "has a crc equal to '9350'" do
      expect(@frame.crc).to eq('9350')
    end

  end

end
