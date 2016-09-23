source 'https://rubygems.org'

gem 'github-pages'
gem 'html-proofer'
gem 'rake'
gem 'google-api-client', '0.8'
gem 'chronic'
gem 's3_website'
gem 'jekyll-redirect-from'
gem 'rb-fsevent'

# http://stackoverflow.com/a/16475580/5967960
def linux_only(require_as)
  RbConfig::CONFIG['host_os'] =~ /linux/ ? require_as : false
end
gem 'rb-inotify', :require => linux_only('rb-inotify')

# needed because we use system libs in the travis build
gem 'pkg-config'
