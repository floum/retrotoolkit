Gem::Specification.new do |s|
  s.name        = 'retrotoolkit'
  s.version     = '0.0.1'
  s.date        = '2010-10-10'
  s.summary     = "Retro Engineering Toolkit"
  s.description = "Gem designed to help with retro-engineering, especially can bus"
  s.authors     = ["Efflam Castel"]
  s.email       = 'efflamm.castel@gmail.com'
  s.files       = ["lib/retrotoolkit.rb",
    "lib/retrotoolkit/can_frame.rb",
    "lib/retrotoolkit/can_frame_set.rb",
    "lib/retrotoolkit/can_usb_269.rb"
  ]
  s.homepage    =
    'http://rubygems.org/gems/retrotoolkit'
  s.license       = 'MIT'
  s.add_development_dependency 'rspec', '~> 2.14.0'
  s.add_development_dependency 'factory_girl', '~> 4.2.0'
end
