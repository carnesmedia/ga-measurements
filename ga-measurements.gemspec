Gem::Specification.new do |s|
  s.name        = 'ga-measurements'
  s.version     = '0.0.3'
  s.summary     = "A simple wrapper for Google Analytics' Universal Measurement API"
  s.description = "A simple wrapper for Google Analytics' Universal Measurement API"
  s.authors     = ["Nathan Carnes"]
  s.email       = 'nathan@carnesmedia.com'
  s.files       = ["lib/ga-measurements.rb"]
  s.homepage    = 'http://github.com/carnesmedia/ga-measurements'
  s.license       = 'MIT'

  s.add_dependency 'uuid'
  s.add_dependency 'httparty'
end
