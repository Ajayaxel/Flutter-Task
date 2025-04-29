import 'package:http/http.dart' as http;

import 'package:rest_api_integration/model/post_model.dart';

class RemotService {
  Future<List<Post>?> getPsot() async {
    var clint = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await clint.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }
}
