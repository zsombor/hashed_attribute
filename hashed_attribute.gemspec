# -*- Mode:Ruby; -*-
$:.push File.expand_path("../lib", __FILE__)

require "hashed_attribute/version"

Gem::Specification.new do |s|
  s.name        = "hashed_attribute"
  s.version     = HashedAttribute::VERSION
  s.authors     = ["Dee Zsombor"]
  s.email       = ["zsombor@primalgrasp.com"]
  s.homepage    = "http://primalgrasp.com"
  s.summary     = "Allows for hashed index lookups on long SQL string/text attributes."
  s.description = "Speeds up string lookups by storing an SHA1 hashed version of the attribute content. The hash is updated automatically, lookups by a constant string value will append a condition on string itself. This helps avoiding the long key problem in MySQL, as well as keeping the lookups faster and more evenly distributed compared to a partial prefix index."

  s.files = Dir["lib/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "activerecord"
  s.add_development_dependency "mysql2"
end 