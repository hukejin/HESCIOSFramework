#
# Be sure to run `pod lib lint HESCIOSFramework.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HESCIOSFramework'
  s.version          = '0.1.0'
  s.summary          = 'A short description of HESCIOSFramework.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/napolun007@gmail.com/HESCIOSFramework'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'hukejin' => 'napolun007@gmail.com' }
  s.source           = { :git => 'https://github.com/hukejin/HESCIOSFramework.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'HESCIOSFramework/Classes/HESCFramework.h'
  
  s.subspec 'toastutil' do |toastutil|
      #子目录PPRuntimeHelper.h和PPRuntimeHelper.m （3级）
      toastutil.source_files = 'HESCIOSFramework/Classes/toastutil/ToastUtil.{h,m}'
     
  end
  
  s.subspec 'colorutil' do |colorutil|
      #子目录PPRuntimeHelper.h和PPRuntimeHelper.m （3级）
      colorutil.source_files = 'HESCIOSFramework/Classes/colorutil/ColorUtil.{h,m}'
     
  end
  
  #开源库头文件
  s.public_header_files = 'HESCIOSFramework/Classes/HESCFramework.h'
  
  # s.resource_bundles = {
  #   'HESCIOSFramework' => ['HESCIOSFramework/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'MBProgressHUD', '~> 1.2.0'
end
