#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint zsh_demo.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'zsh_demo'
  s.version          = '0.0.1'
  s.summary          = 'A new flutter plugin project.'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*','gen/**/*'
  s.public_header_files = 'Classes/**/*.h','gen/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '8.0'


  s.subspec "Protos" do |ss|
     ss.source_files = "gen/protos/*.pbobjc.{m}"
     ss.header_mappings_dir = "gen/protos"
     ss.requires_arc = false
     ss.dependency "Protobuf", '3.13.0'
     ss.user_target_xcconfig = { 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES' }
   end
  

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
end
