Pod::Spec.new do |s|
s.name = 'SwiftyMockJSON'
s.version = '1.0'
s.license = 'MIT'
s.summary = 'SwiftyMockJSON'
s.homepage = 'https://github.com/Yuanjihua1/SwiftyMock'
s.authors = { 'xiuye' => '760629840@qq.com' }
s.source = { :git => 'https://github.com/Yuanjihua1/SwiftyMock.git', :tag => s.version }
s.source_files = 'Source/*'
s.resources = 'Source/*.json'
s.ios.deployment_target = '9.0'
s.framework = 'Foundation'
s.dependency 'CrossroadRegex'
s.pod_target_xcconfig = {'SWIFT_VERSION' => '4' }
end
