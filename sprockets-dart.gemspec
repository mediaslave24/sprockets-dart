Gem::Specification.new do |s|
  s.name = 'sprockets-dart'
  s.version = '0.1'
  s.date = '2013-11-20'

  s.description = "DartEngine for sprockets"
  s.summary     = s.description
  s.license     = "MIT"

  s.authors = ["Michael Lutsiuk"]
  s.email = "mmaccoffe@gmail.com"

  s.files = %w[
    Gemfile
    README.md
    sprockets-dart.gemspec
  ]

  s.add_dependency 'sprockets', '>= 2.0'

  s.homepage = "http://github.com/mediaslave24/sprockets-dart/"
  s.require_paths = %w[lib]
end
