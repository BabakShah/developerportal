### curl  

curl is a command-line tool for Unix systems, and it's perhaps the simplest way to access a RESTful server.  From a unix or linux command line (the '$' below represents the unix prompt), run the following command:  

```shell
$ curl --basic -u 'username:password' -H 'Accept: application/json' https://index.affectiva.com/
```

You will need to replace the username and password with your credentials or you will receive a 401 "unauthorized" response. 