# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'WeatherApp' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  def testing_pods
    pod 'Quick'
    pod 'Nimble'
    pod "Cuckoo"
    pod 'RxTest',     '~> 4.0'
    pod 'RxBlocking', '~> 4.0'
  end

  # Pods for WeatherApp
    pod 'Alamofire', '~> 4.7'
    pod 'Kingfisher', '~> 5.0'
    pod 'RxSwift',    '~> 4.0'
    pod 'RxCocoa',    '~> 4.0'

  target 'WeatherAppTests' do
    inherit! :search_paths
    # Pods for testing
      testing_pods
  end

end
