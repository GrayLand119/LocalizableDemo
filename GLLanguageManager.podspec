Pod::Spec.new do |s|
  s.name = 'GLLanguageManager'
  s.version = '0.0.1'
  s.license = 'MIT'
  s.summary = 'app国际化语言管理工具,可在app内切换语言'
  s.homepage = 'https://github.com/GrayLand119/LocalizableDemo'
  s.authors = { 'GrayLand' => '441726442@qq.com' }
  s.source = { :git => "https://github.com/GrayLand119/LocalizableDemo.git", :tag => "0.0.1"}
  s.requires_arc = true
  s.ios.deployment_target = '8.0'
  s.source_files = 'GLLanguageManager/*.{h,m}'
end
