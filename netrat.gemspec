Gem::Specification.new do |s|
    s.name = "netrat"
    s.version = "1.1.0"
    s.date = Time.new.strftime("%Y-%m-%d")
    s.summary = "Very simple Ruby implementation of netcat"
    s.description = "Very simple Ruby implementation of netcat."
    s.authors = [ "Miles Whittaker" ]
    s.email = "mj@whitta.dev"
    s.files = Dir["lib/**/*.rb"]
    s.homepage = "https://gitlab.com/mjwhitta/netrat"
    s.license = "GPL-3.0"
    s.add_development_dependency("rake", "~> 12.3", ">= 12.3.2")
end
