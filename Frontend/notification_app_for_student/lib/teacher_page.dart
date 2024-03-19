import 'package:flutter/material.dart';
import 'addclass_page.dart';
import 'addinformation_teacher_page.dart';
import 'api.dart';
import 'classes_teacher_page.dart';

class TeacherPage extends StatefulWidget {
  const TeacherPage({super.key});

  @override
  State<TeacherPage> createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  late Future<List<dynamic>> apiTeachers;
  bool _apiCalling = false;
  late List<dynamic> _listTeachers = [
    {'teacher_name': 'none', 'teacher_des': 'none'}
  ];

  void gotoClasses() async {
    String refresh = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ClassesTeacherPage()));
    
    if (refresh == 'refresh') {
      setState(() {
        _apiCalling = false;
      });
    }
  }

  void gotoAddClass() async {
    String refresh = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => const AddClassPage()));

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
            builder: (context) => const AddInformationTeacherPage()));

    if (refresh == 'refresh') {
      setState(() {
        _apiCalling = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_apiCalling) {
      apiTeachers = apiGetTeachers();
      apiTeachers.then((value) {
        setState(() {
          _listTeachers.addAll(value);
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
              'อาจารย์',
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
              Text('ชื่อ-นามสกุล : ${_listTeachers.last['teacher_name']}',
                  style: TextStyle(fontSize: 22, color: Colors.white)),
              SizedBox(
                height: 20,
              ),
              Text('ข้อมูลทั่วไป : ${_listTeachers.last['teacher_des']}',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: gotoClasses,
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(20),
                        disabledBackgroundColor: Colors.white),
                    child: Text(
                      'ดูคลาสทั้งหมด',
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
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
                    onPressed: gotoAddClass,
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(20),
                        disabledBackgroundColor: Colors.white),
                    child: Text(
                      'เพิ่มคลาส',
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
