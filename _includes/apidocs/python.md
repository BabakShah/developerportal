### Python  


This sample uses HTTP Basic authorization.  You will need to replace the username and password with your credentials or you will receive a 401 "unauthorized" response.  

```python
import requests

auth=('username','password')
headers={"Accept":"application/json"}

uri = 'https://index.affectiva.com'

print requests.get(uri, auth=auth, headers=headers).json()
```
