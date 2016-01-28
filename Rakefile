require 'html/proofer'

task :test do
  sh "bundle exec jekyll build"
  options = { :alt_ignore => [/.*/], :disable_external => true, :href_ignore => ['#'], :file_ignore => [/javadoc/,/classdocs/] }
  HTML::Proofer.new("./_site",  options).run
end
