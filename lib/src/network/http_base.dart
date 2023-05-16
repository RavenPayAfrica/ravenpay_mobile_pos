import 'dart:convert';

import 'package:http/http.dart' as http;

const String kBseURL = '';

class HttpBase {
  static Future<dynamic> postRequest(Map map, String route) async {
    var url = Uri.parse('$kBseURL/$route');
    try {
      http.Response response = await http.post(url, body: map);

      if (response.statusCode == 200) {
        String data = response.body;
        var decodedData = jsonDecode(data);
        return decodedData;
      } else {
        return 'failed';
      }
    } catch (e) {
      return null;
    }
  }
}
