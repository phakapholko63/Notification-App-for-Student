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

Future<List<dynamic>> apiGetTeachers() async {
  var url = "http://localhost:3000/api/teachers";
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

Future<List<dynamic>> apiGetStudents() async {
  var url = "http://localhost:3000/api/students";
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

Future<Map<String, dynamic>> apiPostSubject (String subject_name, String subject_des) async {
  var url = "http://localhost:3000/api/addsubject";
  var uri = Uri.parse(url);
  var response = await http.post(
    uri,
    headers: <String, String> {
      'content-type': 'application/json'
    },
    body: jsonEncode( {
      "subject_name": subject_name,
      "subject_des": subject_des
    })
  );

  if (response.statusCode == 201) {
    print('Post Success! : ${response.body}');
    return jsonDecode(response.body) as Map<String, dynamic>;
  } else {
    throw Exception('Request failed!: ${response.statusCode}');
  }
}

Future<Map<String, dynamic>> apiPostTeacher (String teacher_name, String teacher_des) async {
  var url = "http://localhost:3000/api/addteacher";
  var uri = Uri.parse(url);
  var response = await http.post(
    uri,
    headers: <String, String> {
      'content-type': 'application/json'
    },
    body: jsonEncode( {
      "teacher_name": teacher_name,
      "teacher_des": teacher_des
    })
  );

  if (response.statusCode == 201) {
    print('Post Success! : ${response.body}');
    return jsonDecode(response.body) as Map<String, dynamic>;
  } else {
    throw Exception('Request failed!: ${response.statusCode}');
  }
}

Future<Map<String, dynamic>> apiPostStudent (String student_name, String student_des) async {
  var url = "http://localhost:3000/api/addstudent";
  var uri = Uri.parse(url);
  var response = await http.post(
    uri,
    headers: <String, String> {
      'content-type': 'application/json'
    },
    body: jsonEncode( {
      "student_name": student_name,
      "student_des": student_des
    })
  );

  if (response.statusCode == 201) {
    print('Post Success! : ${response.body}');
    return jsonDecode(response.body) as Map<String, dynamic>;
  } else {
    throw Exception('Request failed!: ${response.statusCode}');
  }
}