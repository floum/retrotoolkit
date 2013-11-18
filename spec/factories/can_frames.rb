FactoryGirl.define do
  factory :can_frame do
    value '2340CDAD'
    initialize_with { new(value) }
  end
end
