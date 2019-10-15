import 'dart:convert';

import 'package:http/http.dart' as Http;

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    var response = await Http.get(this.url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
