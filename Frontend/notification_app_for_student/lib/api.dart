import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> apiGetSubjects() async {
  var url = "http://localhost:3000/api/subjects";
  var uri = Uri.parse(url);
  var response = await http.get(uri);

  if (response.statusCode == 200) {
    var list = jsonDecode(response.body) as List<dynamic>;
    print('Request Success!');
    return list;
  } else {
    throw Exception('Request failed!: ${response.statusCode}');
  }
}