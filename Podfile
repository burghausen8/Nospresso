# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Nospresso' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  pod 'R.swift', '~> 5.2.2'
  pod 'SnapKit', '~> 5.0.1'
  pod 'Nuke'
  pod 'Alamofire', '~> 5.2.2'
  
  target 'NospressoTests' do
    inherit! :search_paths
    pod 'SnapshotTesting', '~> 1.8.2'
  end

  target 'NospressoUITests' do
    # Pods for testing
  end

end

post_install do |installer|
    installer.generated_projects.each do |project|
        project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
            end
        end
    end
end
