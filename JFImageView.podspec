Pod::Spec.new do |s|
  s.name         = "JFImageView"
  s.version      = "0.0.1"
  s.summary      = "JFImageView - async UIImageView"

  s.description  = <<-DESC

  JFImageView
  ===========

  ##Async ImageView

  Provides async image download, progress indicator,
  and cache management.

  DESC

  s.homepage     = "https://github.com/jfwork"

  s.license      = { :type => 'MIT', :file => 'LICENSE.txt' }

  s.author             = { "djajcevic" => "denis.jajcevic@gmail.com" }
  s.social_media_url = "hr.linkedin.com/pub/denis-jajčević/52/a4a/a11/"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.platform     = :ios, '6.0'

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source       = { :git => "https://github.com/jfwork/JFImageView.git", :tag => "0.0.1" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source_files  = 'Classes', 'JFImageView/Classes/**/*.{h,m}'
  s.exclude_files = 'JFImageView/Classes/Exclude'

  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.frameworks = 'Foundation', 'UIKit'

  s.dependency 'JFDownload', '0.0.2'

  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.requires_arc = true
end