#
# Be sure to run `pod lib lint QTFloatingDrawer.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'QTFloatingDrawer'
  s.version          = '0.0.1'
  s.summary          = 'QTFloatingDrawer is implementation of KGFloatingDrawer in SWIFT 4'
  s.description      = 'This is simple library developed in SWIFT 4 for integrating Floating Drawer in your iOS App'
  s.homepage         = 'https://github.com/BhumaJ/QTFloatingDrawer'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'BhumaJ' => 'jay.savsani07@gmail.com' }
  s.source           = { :git => 'https://github.com/BhumaJ/QTFloatingDrawer.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.ios.deployment_target = '8.0'
  s.source_files = 'QTFloatingDrawer/Classes/**/*'

end
