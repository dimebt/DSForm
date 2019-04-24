
Pod::Spec.new do |s|


  s.name         = "DSForm"
  s.version      = "1.0.4"
  s.summary      = "Simple form library for iOS written in Swift"
  s.description  = <<-DESC
Simple to use form builder framework for iOS. Build on top of UICollectionView.
                   DESC

  s.homepage     = "https://github.com/dimebt/DSForm"
  s.screenshots  = "https://github.com/dimebt/DSForm/blob/master/images/screenshot_simulator.png?raw=true", "https://raw.githubusercontent.com/dimebt/DSForm/master/images/screenshoot_xcode.png"

  s.license      = "MIT"


  s.author             = { "Dimitar Stefanovski" => "dimebt_2005@hotmail.com" }
  s.social_media_url   = "https://www.instagram.com/dime_codes/"

  s.platform     = :ios, "12.2"

  s.source       = { :git => "https://github.com/dimebt/DSForm.git", :tag => "1.0.4" }


  s.source_files  = "**/*.{h,m,swift}"
  s.resources = "*.xib"

end