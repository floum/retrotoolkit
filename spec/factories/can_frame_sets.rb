FactoryGirl.define do
  factory :can_frame_set do
    frames { Array.new(10) { FactoryGirl.build(:can_frame) } }
    initialize_with { new(frames) }
  end
end
