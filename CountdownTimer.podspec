Pod::Spec.new do |s|
    s.name         = 'CountdownTimer'
    s.version      = '1.0.1'
    s.summary      = '倒计时器'
    s.homepage     = 'https://github.com/SLpersonal/CountDownTimer'
    s.description  = <<-DESC
                     倒计时器，退到后台，再进入前台，时间显示将退到后台的时间自动减去
                   DESC
    s.license      = 'MIT'
    s.authors      = {'ShiLei' => '412499326@qq.com'}
    s.platform     = :ios, '6.0'
    s.source       = {:git => 'https://github.com/SLpersonal/CountDownTimer.git', :tag => s.version}
    s.source_files = 'CountdownTimerLabel/*.{h,m}'  #注意这里，这个路径是相对于podspec文件的路径，XLPhotoBrowser文件的路径现在与podspec文件同级
    s.requires_arc = true
end

