Pod::Spec.new do |s|
    s.name         = 'CountdownTimer'
    s.version      = '1.0.0'
    s.summary      = 'a component of photo browser on iOS'
    s.homepage     = 'https://github.com/xiaoL0204/XLPhotoBrowser'
    s.description  = <<-DESC
                                      It is a component for ios photo browser,written by Objective-C.
                   DESC
    s.license      = 'MIT'
    s.authors      = {'SL' => '412499326@qq.com'}
    s.platform     = :ios, '6.0'
    s.source       = {:git => 'https://github.com/SLpersonal/CountDownTimer.git', :tag => s.version}
    s.source_files = 'CountdownTimerLabel/*.{h,m}'  #注意这里，这个路径是相对于podspec文件的路径，XLPhotoBrowser文件的路径现在与podspec文件同级
   #  s.dependency "SDWebImage", "~> 3.7.1"
    s.requires_arc = true
end

