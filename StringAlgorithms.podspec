Pod::Spec.new do |s|
  s.name             = 'StringAlgorithms'
  s.version          = '0.1.1'
  s.summary          = 'String algorithms and data structures, implemented in Swift.'
  s.description      = <<-DESC
String algorithms and data structures for efficient search and manipulation of Strings, written in Swift.
                       DESC
  s.homepage         = 'https://github.com/edmundmok/StringAlgorithms.Swift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Edmund Mok' => 'edmundmok@outlook.com' }
  s.source           = { :git => 'https://github.com/edmundmok/StringAlgorithms.Swift.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'StringAlgorithms/**/*.swift'
  s.frameworks = 'Foundation'
end
