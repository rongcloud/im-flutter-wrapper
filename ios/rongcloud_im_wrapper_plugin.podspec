im_sdk_version = 'Unknown'

config = File.expand_path(File.join('..', '..', 'version.config'), __FILE__)

File.foreach(config) do |line|
    matches = line.match(/ios_im_sdk_version\=(.*)/)
    if matches
      im_sdk_version = matches[1].split("#")[0].strip
    end
end

if im_sdk_version == 'Unknown'
    raise "You need to config ios_im_sdk_version in version.config!!"
end

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
  s.dependency 'RongCloudIM/IMLibCore', im_sdk_version
  s.dependency 'RongCloudIM/ChatRoom', im_sdk_version
end
