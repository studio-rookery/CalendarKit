Pod::Spec.new do |spec|
  spec.name         = "CalendarKit"
  spec.version      = "0.0.2"
  spec.summary      = "Type safe, simple, light weight calendar components."
  spec.homepage     = "https://github.com/studio-rookery/CalendarKit"
  spec.license      = "MIT"
  spec.author             = { "masaki" => "studio.rookery@gmail.com" }

  spec.swift_version = "4.2"

  spec.ios.deployment_target = "10.0"
  spec.osx.deployment_target = "10.12"

  spec.source       = { :git => "https://github.com/studio-rookery/CalendarKit.git", :tag => "#{spec.version}" }
  spec.source_files  = "Sources/**/*.{swift,h,m}"
end
