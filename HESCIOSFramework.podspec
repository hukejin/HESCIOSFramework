#
# Be sure to run `pod lib lint HESCIOSFramework.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HESCIOSFramework'
  s.version          = '0.4.0'
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
  s.author           = { 'liujunlin' => 'liujunlin@jrfreestyle.cn' }
  s.source           = { :git => 'https://gitee.com/JieAoKeJi_liujunlin/hesciosframework.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'HESCIOSFramework/Classes/HESCFramework.h'
  
  s.subspec 'toastutil' do |toastutil|
      toastutil.source_files = 'HESCIOSFramework/Classes/toastutil/ToastUtil.{h,m}'
     
  end
  
  s.subspec 'colorutil' do |colorutil|
      colorutil.source_files = 'HESCIOSFramework/Classes/colorutil/ColorUtil.{h,m}'
     
  end
  
  s.subspec 'imageutil' do |imageutil|
      imageutil.source_files = 'HESCIOSFramework/Classes/imgbase64util/Image2Base64.{h,m}'
     
  end
  
  s.subspec 'datetimeutil' do |datetimeutil|
      datetimeutil.source_files = 'HESCIOSFramework/Classes/datetimeutil/TimeUtil.{h,m}'
     
  end
  
  s.subspec 'viewctrlutil' do |viewctrlutil|
      viewctrlutil.source_files = 'HESCIOSFramework/Classes/viewctrlutil/ViewControllerTool.{h,m}'
     
  end
  
  s.subspec 'httputil' do |httputil|
      httputil.source_files = 'HESCIOSFramework/Classes/httputil/HttpUtil.{h,m}'
     
  end
  
  s.subspec 'animatorutil' do |animatorutil|
      animatorutil.source_files = 'HESCIOSFramework/Classes/animatorutil/AnimatorUtil.{h,m}'
     
  end
  
  s.subspec 'photoalbumutil' do |photoalbumutil|
      photoalbumutil.source_files = 'HESCIOSFramework/Classes/photoalbumutil/PhotoAlbum.{h,m}'
     
  end
  
  s.subspec 'displayutil' do |displayutil|
      displayutil.source_files = 'HESCIOSFramework/Classes/displayutil/DisplayUtil.{h,m}'
     
  end
  
  s.subspec 'permissionutil' do |displayutil|
      displayutil.source_files = 'HESCIOSFramework/Classes/permissionutil/CheckPermissionUtil.{h,m}'
     
  end
  
  #开源库头文件
  s.public_header_files = 'HESCIOSFramework/Classes/HESCFramework.h'
  
  # s.resource_bundles = {
  #   'HESCIOSFramework' => ['HESCIOSFramework/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'AFNetworking', '~> 4.0'
  s.dependency 'MBProgressHUD', '~> 1.2.0'
end
