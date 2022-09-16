#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint im_interface_wrapper_flutter.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'rongcloud_im_wrapper_plugin'
  s.version          = '0.0.1'
  s.summary          = 'Rongcloud im interface wrapper for flutter.'
  s.description      = <<-DESC
  Rongcloud im interface wrapper for flutter.
                       DESC
  s.homepage         = 'https://www.rongcloud.cn/'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'rongcloud' => 'zhangyifan@rongcloud.cn' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'
  s.static_framework = true
  s.vendored_frameworks = 'Frameworks/*.xcframework'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386 arm64' }
  s.dependency 'RongCloudIM/IMLibCore', '5.2.5'
  s.dependency 'RongCloudIM/ChatRoom', '5.2.5'
end
