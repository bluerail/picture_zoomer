Gem::Specification.new do |s|
  s.name = 'picture_zoomer'
  s.version = '1.0'
  s.authors = ['Martin Tournoij']
  s.email = ['martin@arp242.net']
  s.license = 'MIT'
  s.homepage = 'https://github.com/bluerail/picture_zoomer'
  s.summary = 'Simple "zooming lightbox" that doesn\'t suck.'

  s.files = Dir['{lib}/**/*', 'MIT-LICENSE', 'README.markdown']

  s.add_dependency 'jquery-rails'
  # Not required since we compile them
  #s.add_dependency 'coffee-rails'
  #s.add_dependency 'sass'
end
