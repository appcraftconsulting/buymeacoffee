Pod::Spec.new do |spec|
  spec.name          = 'BuyMeACoffee'
  spec.version       = '1.1'
  spec.license       = { :type => 'MIT' }
  spec.homepage      = 'https://github.com/appcraftstudio/buymeacoffee'
  spec.authors       = { 'François Boulais' => 'francois@appcraftstudio.com' }
  spec.summary       = 'Buy Me A Coffee framework for iOS'
  spec.source        = { :git => 'https://github.com/appcraftstudio/buymeacoffee.git', :tag => "v#{spec.version}" }
  spec.swift_version = '5.0'

  spec.ios.deployment_target  = '11.0'
  spec.osx.deployment_target  = '10.10'

  spec.source_files   = 'Sources/**/*.swift', 'Bundle.swift'

  spec.framework      = 'SystemConfiguration'
  spec.ios.framework  = 'UIKit', 'WebKit'
  spec.osx.framework  = 'AppKit', 'WebKit'
end
