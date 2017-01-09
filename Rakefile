require 'html-proofer'

task :test do
  sh "bundle exec jekyll build --config _config-development.yml"
  options = { :alt_ignore => [/.*/], :disable_external => true, :allow_hash_href => true, :url_ignore => ["/404", "/formcomplete"], :file_ignore => [/javadoc/,/classdocs/] }
  HTMLProofer.check_directory("./_site",  options).run
end
