import 'package:flutter/material.dart';
import 'api.dart';

class ClassesPage extends StatefulWidget {
  const ClassesPage({super.key});

  @override
  State<ClassesPage> createState() => _ClassesPageState();
}

class _ClassesPageState extends State<ClassesPage> {
  late Future<List<dynamic>> apiSubject;
  late List<dynamic> _listSubjects = [];
  bool _apiCalling = false;

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
                trailing: Icon(Icons.more_vert),
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
