target 'Cocktail' do
  use_frameworks!

  

  target 'CocktailTests' do
    inherit! :search_paths
    pod 'Nimble'
    pod 'Quick'
    pod 'OHHTTPStubs'
  end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        if target.name == '<insert target name of your pod here>'
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '4.2'
            end
        end
    end
end

end
