import 'package:flutter/material.dart';
import 'api.dart';

class ClassesTeacherPage extends StatefulWidget {
  const ClassesTeacherPage({super.key});

  @override
  State<ClassesTeacherPage> createState() => _ClassesTeacherPageState();
}

class _ClassesTeacherPageState extends State<ClassesTeacherPage> {
  late Future<List<dynamic>> apiSubject;
  late List<dynamic> _listSubjects = [];
  bool _apiCalling = false;

  void notiClass (String classname) {
    final snackBar = SnackBar(
        content: Text('Notification for $classname class', style: TextStyle(color: Colors.amber)),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    if (!_apiCalling) {
      apiSubject = apiGetSubjects();
      apiSubject.then((value) {
        setState(() {
          _listSubjects.addAll(value);
          _apiCalling = true;
        });
      });
      print('Successfully calling api');
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        toolbarHeight: 150,
        title: Container(
            padding: EdgeInsets.all(20),
            color: Colors.black,
            child: Text(
              'คลาสเรียน',
              style: TextStyle(color: Colors.white, fontSize: 36),
            )),
      ),
      body: Container(
        color: Colors.deepPurple,
        child: ListView.builder(
          itemCount: _listSubjects.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(20),
              child: ListTile(
                leading: CircleAvatar(
                  child: Text('${_listSubjects[index]['subject_name'].toUpperCase().substring(0, 1)}'),
                ),
                title: Text('${_listSubjects[index]['id'].toString() + '. '+ _listSubjects[index]['subject_name']}'),
                subtitle: Text('${_listSubjects[index]['subject_des']}'),
                trailing: InkWell(
                  child: Icon(Icons.notification_important_rounded, color: Colors.red),
                  onTap: () => notiClass('${_listSubjects[index]['subject_name']}'),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 150,
        ),
        color: Colors.amber,
      ),
    );
  }
}
