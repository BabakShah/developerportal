require 'html/proofer'

task :test do
  sh "bundle exec jekyll build --config _config-development.yml"
  options = { :alt_ignore => [/.*/], :disable_external => true, :href_ignore => ['#'], :file_ignore => [/javadoc/,/classdocs/] }
  HTML::Proofer.new("./_site",  options).run
end
