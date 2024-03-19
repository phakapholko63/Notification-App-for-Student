import 'package:flutter/material.dart';
import 'api.dart';

class AddInformationTeacherPage extends StatefulWidget {
  const AddInformationTeacherPage({super.key});

  @override
  State<AddInformationTeacherPage> createState() => _AddInformationTeacherPageState();
}

class _AddInformationTeacherPageState extends State<AddInformationTeacherPage> {
  final _teachernameController = TextEditingController();
  final _teacherinformationController = TextEditingController();

  late Future<Map<String, dynamic>> apiUpdate;

  void submitInformation () {

    String teacher_name = _teachernameController.text;
    String teacher_des = _teacherinformationController.text;

    apiUpdate = apiPostTeacher(teacher_name, teacher_des);
    apiUpdate.then((value) {
      final snackBar = SnackBar(
        content: Text('Successfully created teacher!', style: TextStyle(color: Colors.green)),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context, 'refresh');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        toolbarHeight: 150,
        title: Container(
            padding: EdgeInsets.all(20),
            color: Colors.black,
            child: Text(
              'เพิ่มข้อมูลอาจารย์',
              style: TextStyle(color: Colors.white, fontSize: 36),
            )),
      ),
      body: Container(
        color: Colors.deepPurple,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Text('Enter Name',
                  style: TextStyle(fontSize: 26, color: Colors.white)),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                child: TextField(
                  controller: _teachernameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Name',
                      fillColor: Colors.white,
                      filled: true),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text('Enter General Information',
                  style: TextStyle(fontSize: 26, color: Colors.white)),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                child: TextField(
                  controller: _teacherinformationController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter General Information',
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 40.0, horizontal: 13.0),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: submitInformation,
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    backgroundColor: Colors.green
                ),
                child: Text(
                  'เพิ่มข้อมูล',
                  style: TextStyle(fontSize: 26, color: Colors.white),
                ),
              ),
            ],
          ),
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
