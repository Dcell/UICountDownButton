Pod::Spec.new do |s|

  s.name         = "UICountDownButton"
  s.version      = "1.0.0"
  s.summary      = "A simple countdown button "

  s.description  = "A simple countdown button 一个简单的倒计时"

  s.homepage     = "https://github.com/Dcell/UICountDownButton.git"

  s.license      = { :type => "MIT", :file => "LICENSE" }


  s.author             =  "dingqili"

  s.platform     = :ios
  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/Dcell/UICountDownButton.git", :tag => "#{s.version}" }

	s.frameworks = "UIKit","Foundation"
	
  s.source_files  = "Classes", "UICountDownButton/**/*.{h,m,swift}"



end