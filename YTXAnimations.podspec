#
# Be sure to run `pod lib lint YTXAnimations.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = "YTXAnimations"
    s.version          = "1.4.0"
    s.summary          = "提供UIView的动画"
    
    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!
    s.description      = "The iOS animation implementation of CSS3"
    
    s.homepage         = "https://github.com/baidao/YTXAnimations"
    #  s.screenshots      = "https://github.com/baidao/YTXAnimations/blob/master/YTXAnimations.gif"
    s.license          = 'MIT'
    s.author           = { "caojun" => "78612846@qq.com" }
    s.source           = { :git => "https://github.com/baidao/YTXAnimations.git", :tag => s.version.to_s }
    # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
    
    s.platform     = :ios, '7.0'
    s.requires_arc = true
    
    s.source_files = 'Pod/Classes/**/*'
    #s.resource_bundles = {
    #    'YTXAnimations' => ['Pod/Assets/*.png']
    #}
    
    YTXAnimateCSS   = { :spec_name => "AnimateCSS" }
    YTXCSShake   = { :spec_name => "CSShake" }
    YTXMagicCSS   = { :spec_name => "MagicCSS" }
    
    $animations = [YTXAnimateCSS, YTXCSShake, YTXMagicCSS]
    
    $animations.each do |sync_spec|
        s.subspec sync_spec[:spec_name] do |ss|
            
            specname = sync_spec[:spec_name]
            
            sources = ["Pod/Classes/UIView+YTX#{specname}.*", "Pod/Classes/YTXAnimationsUtil.{h,m}"]
            
            ss.source_files = sources
            
#            ss.dependency 'YTXAnimations/Default'

            if sync_spec[:dependency]
                sync_spec[:dependency].each do |dep|
                    ss.dependency dep[:name], dep[:version]
                end
            end
            
        end
    end
    
    s.subspec "Transformer" do |ss|
        ss.source_files = ["Pod/Classes/YTXGooeyCircleLayer.{h,m}", "Pod/Classes/YTXCountDownShowLayer.{h,m}"]
    end

    s.frameworks = 'UIKit', 'CoreGraphics', 'QuartzCore'
end
