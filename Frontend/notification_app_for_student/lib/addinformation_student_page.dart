import 'package:flutter/material.dart';
import 'api.dart';

class AddInformationStudentPage extends StatefulWidget {
  const AddInformationStudentPage({super.key});

  @override
  State<AddInformationStudentPage> createState() => _AddInformationStudentPageState();
}

class _AddInformationStudentPageState extends State<AddInformationStudentPage> {
  final _studentnameController = TextEditingController();
  final _studentinformationController = TextEditingController();

  late Future<Map<String, dynamic>> apiUpdate;

  void submitInformation () {

    String student_name = _studentnameController.text;
    String student_des = _studentinformationController.text;

    apiUpdate = apiPostStudent(student_name, student_des);
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
              'เพิ่มข้อมูลนักเรียน',
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
                  controller: _studentnameController,
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
                  controller: _studentinformationController,
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
