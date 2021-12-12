#
# Be sure to run `pod lib lint ThemeKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Theme-Kit'
  s.version          = '0.1.0'
  s.summary          = 'A lightweight UI library for Swift.'
  s.swift_version = '4.0'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'A lightweight swift library that lets you simplify otherwise complex UI elements and animations.'

  s.homepage         = 'https://github.com/samuelail/ThemeKit'
  s.license      = 'MIT'
  s.screenshots     = 'https://github.com/samuelail/ThemeKit/blob/master/Simulator%20Screen%20Shot%20-%20iPhone%2012%20-%202021-12-11%20at%2019.41.49.png?raw=true'
  #s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Samuel Ailemen' => 'samuel@verified.ly' }
  s.source           = { :git => 'https://github.com/samuelail/ThemeKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/kingjulian_i'

  s.ios.deployment_target = '9.0'

  s.source_files = 'ThemeKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ThemeKit' => ['ThemeKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
