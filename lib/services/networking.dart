import 'dart:convert';
import 'package:http/http.dart';

class NetworkHelper {
  String url;
  var decodedData;

  NetworkHelper(this.url);

  Future getData() async {
    Response response = await get(this.url);

    if(response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    else
      print('Error code: $response.statusCode.toString()');
  }
}