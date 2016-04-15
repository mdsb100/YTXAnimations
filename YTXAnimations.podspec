#
# Be sure to run `pod lib lint YTXAnimations.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "YTXAnimations"
  s.version          = "1.0.1"
  s.summary          = "提供UIView的动画"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = "请参考 http://daneden.github.io/animate.css/#23cta"

  s.homepage         = "https://github.com/baidao/YTXAnimations"
#  s.screenshots      = "https://github.com/baidao/YTXAnimations/blob/master/YTXAnimations.gif"
  s.license          = 'MIT'
  s.author           = { "caojun" => "78612846@qq.com" }
  s.source           = { :git => "https://github.com/baidao/YTXAnimations.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'YTXAnimations' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'JHChainableAnimations', '~> 1.3.0'
end
