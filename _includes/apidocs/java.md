### Java  

This sample uses HTTP Basic authorization.  You will need to replace the username and password with your credentials or you will receive a 401 "unauthorized" response.  

```java
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.IOException;
import java.net.URL;
import java.net.URLConnection;

public class index_w_basic {
    public static final void main(final String[] args) {
        try {
            String credentials = "username" + ":" + "password";
            String basicAuth = "Basic " + javax.xml.bind.DatatypeConverter.printBase64Binary(credentials.getBytes());

            URL url = new URL("https://index.affectiva.com/");
            URLConnection connection = url.openConnection();
            connection.setRequestProperty("Authorization", basicAuth);
            connection.setRequestProperty("Accept", "application/json");
            InputStream in = connection.getInputStream();
            dumpStream(in);
        } catch (IOException e) {
            e.printStackTrace();
            }
        }
    
        private static void dumpStream(InputStream in) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(in));
        String readLine;
        while (((readLine = br.readLine()) != null)) {
            System.out.println(readLine);
        }
    }
}
```