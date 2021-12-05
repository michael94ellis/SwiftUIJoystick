Pod::Spec.new do |s|
  s.name = 'SwiftUIJoystick'
  s.version = '1.0.2'
  s.swift_versions = '5.0'
  s.license = 'MIT'
  s.summary = 'This is a customizable SwiftUI Joystick that provides XY and Polar coordinates.'
  s.homepage = 'https://michaelrobertellis.com'
  s.social_media_url = 'http://michaelrobertellis.com/contact'
  s.documentation_url = 'http://github.com/michael94ellis/SwiftUIJoystick'
  s.author = "Michael Ellis"
  s.source = { :git => 'https://github.com/michael94ellis/SwiftUIJoystick.git', :branch => 'main', :tag => s.version }

  s.ios.deployment_target = '13.0'

  s.source_files = 'Sources/SwiftUIJoystick/*.swift'
  s.requires_arc = true

  s.resource_bundles = {
  }
end
