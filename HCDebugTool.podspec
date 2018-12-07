#
# Be sure to run `pod lib lint HCDebugTool.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HCDebugTool'
  s.version          = '0.1.3'
  s.summary          = 'My iOS DebugTool HCDebugTool'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
My iOS DebugTool HCDebugTool.
                       DESC

  s.homepage         = 'https://github.com/HonchWong/HCDebugTool'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'honchwong404@gmail.com' => 'honchwong404@gmail.com' }
  s.source           = { :git => 'https://github.com/HonchWong/HCDebugTool.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'HCDebugTool/Classes/**/*.{h,m}'

  # s.resource_bundles = {
  #   'HCDebugTool' => ['HCDebugTool/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
