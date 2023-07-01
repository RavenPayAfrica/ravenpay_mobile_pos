import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/helpers/logger.dart';

class HttpBase {

  static Future<dynamic> postRequest(Map<String, dynamic> map, String route) async {
    var url = Uri.parse('$hostUrl/$route');
    try {
      http.Response response = await http.post(url, body: map);

      if (response.statusCode == 200) {
        String data = response.body;
        logData(data.toString() + ' visible response');
        var decodedData = jsonDecode(data);
        return decodedData;
      } else {
        return 'failed';
      }
    } catch (e) {
      return null;
    }
  }

  static Future<dynamic> getRequestWithHeader(Map<String, String> theHeader, String route) async {
    var url = Uri.parse('$route');
    try {
      http.Response response = await http.get(url, headers: theHeader);

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

  static Future<dynamic> postRequestJson(Map<String, dynamic> map, String route) async {

    var url = Uri.parse('$hostUrl/$route');

   try{

     logData('$hostUrl/$route');

     var body = json.encode(map);

     http.Response response = await http.post(url, body: body, headers: {"Content-Type": "application/json"});

     if (response.statusCode == 200) {
       String data = response.body;
       logData(data.toString() + ' visible response');
       var decodedData = jsonDecode(data);
       return decodedData;
     } else {
       return 'failed';
     }

   }catch (e){
     return null;
   }

  }


  static String get hostUrl =>
      pluginConfig.isStaging ? baseURLDev : baseURLProd;
}
