import 'dart:convert';

import 'package:dummy_api/SinglePageModel.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<dynamic> getSinglePostWithModel() async {
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
      var res = await http.get(url);
      if (res.statusCode == 200) {
        final body = res.body;
        final data = jsonDecode(body);
        return data;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
