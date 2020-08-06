Pod::Spec.new do |spec|
  spec.name             = 'BuyMeACoffee'
  spec.version          = '1.0.0'
  spec.license          = { :type => 'MIT', :text => <<-LICENSE
                   Copyright © 2020 App Craft Studio. All rights reserved.
                 LICENSE
               }
  spec.homepage         = 'https://github.com/appcraftstudio/buymeacoffee'
  spec.author           = { 'François Boulais' => 'francois@appcraftstudio.com' }
  spec.social_media_url = "https://linkedin.com/company/appcraftstudio"
  spec.summary          = 'Buy Me a Coffee framework for iOS'
  spec.source           = { :git => 'https://github.com/appcraftstudio/buymeacoffee.git', :tag => "#{spec.version}" }
  spec.swift_version = '5.0'

  spec.ios.deployment_target  = '11.0'

  spec.source_files     = 'Sources/**/*.swift', 'Bundle.swift'
  spec.resources        = 'Sources/**/Resources/*'

  spec.platform         = :ios, '11.0'
  spec.ios.framework    = 'UIKit', 'WebKit'
end