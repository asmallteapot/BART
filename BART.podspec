Pod::Spec.new do |s|
  s.name         = 'BART'
  s.version      = '0.0.3'
  s.summary      = 'Swift module for accessing the BART API'

  s.description  = <<-DESC
    This is a Swift module for accessing the BART API. Compatible with Apple platforms + Linux
  DESC

  s.homepage     = 'https://github.com/asmallteapot/BART'
  s.license      = { type: 'MIT', file: 'LICENSE' }

  s.author             = { 'Ellen Teapot' => 'hi@asmallteapot.com' }
  s.social_media_url   = 'https://twitter.com/asmallteapot'

  s.ios.deployment_target = '12.0'
  s.osx.deployment_target = '10.14'
  s.tvos.deployment_target = '12.0'
  s.watchos.deployment_target = '4.0'

  s.framework = 'Foundation'
  s.dependency 'Moya', '~> 12.0.1'

  s.swift_version = '4.2'

  s.source = {
    git: 'https://github.com/asmallteapot/BART.git',
    tag: s.version
  }

  s.source_files = 'Sources/BART/**/*.{h,m,swift}'
end
