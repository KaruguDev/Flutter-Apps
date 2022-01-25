import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class RequestHTTP {
  RequestHTTP(this.url);
  Uri url;

  Future getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      var jsonData = convert.jsonDecode(data);
      return jsonData;
    } else {
      print(response.statusCode);
    }
  }
}
