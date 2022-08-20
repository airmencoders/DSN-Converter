# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'DSN Converter' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  pod 'PMAlertController'
pod 'CountdownLabel'
pod 'NotificationBannerSwift'
pod 'paper-onboarding'
pod 'Floaty', '~> 4.2.0'



post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
    # some older pods don't support some architectures, anything over iOS 11 resolves that
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
    end
  end
end

  # Pods for DSN Converter

end
