require 'jekyll'

module Jekyll
  class DownloadCounter < Generator
    def generate(site)
      builds_count = Hash.new
      site.data['downloads']['statuses'].each { |status| builds_count[status] = 0 }
        site.data['downloads']['statuses'].each do |status|
          site.data['downloads']['platforms'].each do |platform|
            if platform['versions']
              builds_count[status] += platform['versions'].count{ |hash| hash["status"] == status }
            end
          end
        end
      site.data['downloads']['builds_count'] = builds_count
    end
  end
end
