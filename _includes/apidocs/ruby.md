### Ruby  


This sample uses HTTP Basic authorization.  You will need to replace the username and password with your credentials or you will receive a 401 "unauthorized" response.  

```ruby
require 'net/http'
require 'uri'

uri = URI 'https://index.affectiva.com/'

Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
  request = Net::HTTP::Get.new uri
  request.basic_auth 'username', 'password'
  request['Accept'] = 'application/json'
  response = http.request request
  
  puts response.body
end
```