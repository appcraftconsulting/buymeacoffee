Pod::Spec.new do |spec|
  spec.name                  = 'BuyMeACoffee'
  spec.version               = '1.0.0'
  spec.license               = { :type => 'BSD' }
  spec.homepage              = 'https://github.com/appcraftstudio/buymeacoffee'
  spec.author                = { 'François Boulais' => 'francois@appcraftstudio.com' }
  spec.summary               = 'Buy Me a Coffee framework for iOS'
  spec.source                = { :git => 'https://github.com/appcraftstudio/buymeacoffee.git', :tag => "#{spec.version}" }

  spec.ios.deployment_target = '11.0'
  spec.platform              = :ios, '11.0'
  spec.swift_version         = '5.0'

  spec.source_files          = 'Sources/**/*.swift', 'Bundle.swift'
  spec.resources             = 'Sources/**/Resources/*'

  spec.ios.framework         = 'UIKit', 'WebKit'
end
