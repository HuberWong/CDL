

Pod::Spec.new do |spec|

  spec.name         = "CDL"
  spec.version      = "0.1.2"
  spec.summary      = "A iPhone information lib."

  spec.description  = "CDL(Crispy Duck Leg) is an iPhone information library including battery information, screen size, etc."
  spec.homepage     = "https://github.com/HuberWong/CDL"
  spec.license      = "MIT"
  spec.author             = { "HuberWong" => "85234311+HuberWong@users.noreply.github.com" }

  # spec.platform     = :ios
  spec.platform     = :ios, "11.0"




  spec.source       = { :git => "https://github.com/HuberWong/CDL.git", :tag => spec.version.to_s }


  spec.source_files  = "CDL/**/**/*.{swift}"
  spec.swift_version = "5.0"

end
