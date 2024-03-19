import 'package:flutter/material.dart';
import 'addinformation_student_page.dart';
import 'classes_page.dart';
import 'api.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {

  late Future<List<dynamic>> apiStudents;
  bool _apiCalling = false;
  late List<dynamic> _listStudents = [
    {'student_name': 'none', 'student_des': 'none'}
  ];

  void gotoClasses() async {
    String refresh = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ClassesPage()));

    if (refresh == 'refresh') {
      setState(() {
        _apiCalling = false;
      });
    }
  }

  void gotoAddInformation() async {
    String refresh = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const AddInformationStudentPage()));

    if (refresh == 'refresh') {
      setState(() {
        _apiCalling = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    if (!_apiCalling) {
      apiStudents = apiGetStudents();
      apiStudents.then((value) {
        setState(() {
          _listStudents.addAll(value);
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
              'นักเรียน',
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
                height: 40,
              ),
              CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                    'https://static-00.iconduck.com/assets.00/profile-circle-icon-2048x2048-cqe5466q.png'),
              ),
              SizedBox(
                height: 40,
              ),
              Text('ชื่อ-นามสกุล : ${_listStudents.last['student_name']}',
                  style: TextStyle(fontSize: 22, color: Colors.white)),
              SizedBox(
                height: 20,
              ),
              Text('ข้อมูลทั่วไป : ${_listStudents.last['student_des']}',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: gotoAddInformation,
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(20),
                        disabledBackgroundColor: Colors.white),
                    child: Text(
                      'เพิ่มข้อมูล',
                      style: TextStyle(fontSize: 26, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                    onPressed: gotoClasses,
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(20),
                        disabledBackgroundColor: Colors.white),
                    child: Text(
                      'ดูคลาสเรียน',
                      style: TextStyle(fontSize: 26, color: Colors.black),
                    ),
                  ),
                ],
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
