$LOAD_PATH << File.join(File.dirname(__FILE__), "lib")

Gem::Specification.new do |s|
  s.name          = "typus_coroutine"
  s.version       = "0.1.0"
  s.date          = Date.today
  
  s.platform      = Gem::Platform::RUBY
  s.authors       = [ "Rick Branson" ]
  s.summary       = "Coroutine's extensions for Typus"
  s.description   = "Coroutine's extensions for Typus including styling and Authlogic support."
  
  s.files         = Dir.glob("**/*") - [ "typus_coroutine.gemspec" ]
  s.require_path  = "lib"
end
