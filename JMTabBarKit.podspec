Pod::Spec.new do |s|

  s.name          = "JMTabBarKit"
  s.version       = "1.0.1"
  s.license       = "MIT"
  s.summary       = "A custom tabbar using Objective-C."
  s.homepage      = "https://github.com/James-oc/JMTabBarKit"
  s.author        = { "xiaobs" => "1007785739@qq.com" }
  s.source        = { :git => "https://github.com/James-oc/JMTabBarKit.git", :tag => "1.0.1" }
  s.requires_arc  = true
  s.description   = <<-DESC
                   JMTabBarKit - A custom tabbar using Objective-C.
                   DESC
  s.source_files  = "JMTabBarKit/*/*"
  s.platform      = :ios, '6.0'
  s.framework     = 'Foundation', 'UIKit'  

end