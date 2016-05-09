platform :ios, '8.0'
use_frameworks!

post_install do |installer|
    installer.pods_project.build_configuration_list.build_configurations.each do |configuration|
        configuration.build_settings['CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES'] = 'YES'
    end
end

pod 'RxSwift', '~> 2.0.0-beta.4'
pod 'RxCocoa', '~> 2.0.0-beta.4'
pod 'RxBlocking', '~> 2.0.0-beta.4'

pod 'Parse'
pod 'DynamicColor'
pod 'CameraEngine', '~> 0.9'

pod 'SnapKit'
pod 'Masonry'

pod 'ParseFacebookUtilsV4'
pod 'FBSDKCoreKit'