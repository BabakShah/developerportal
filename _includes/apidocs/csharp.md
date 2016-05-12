### C\#

This sample uses HTTP Basic authorization. You will need to replace the username and password with your credentials or you will receive a 401 “unauthorized” response.  

```csharp
public static async Task<string> GetResponse(string url, string username, string password) {
    var result = new StringBuilder();
    using (var client = new HttpClient()) {
        client.BaseAddress = new Uri(url);               
        client.DefaultRequestHeaders.Accept.Clear();
        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
        string credentials = string.Format("{0}:{1}", username, password);
        string encodedCredentials = Convert.ToBase64String(ASCIIEncoding.ASCII.GetBytes(credentials));
        client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Basic", encodedCredentials);

        HttpResponseMessage response = await client.GetAsync("");
        if (response.IsSuccessStatusCode) {
            Stream stream = await response.Content.ReadAsStreamAsync();
            var sr = new StreamReader(stream);
            string readLine = null;
            while ((readLine = sr.ReadLine()) != null) {
                result.Append(readLine);
            }                   
        }
    }
    return result.ToString();           
}
```