import 'package:flutter/material.dart';
import 'package:notification_app_for_student/student_page.dart';

import 'teacher_page.dart';

class SelectPage extends StatefulWidget {
  const SelectPage({super.key});

  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  void studentRole () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const StudentPage())
    );
  }

  void teacherRole () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TeacherPage())
    );
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
          child: Text('Notification APP', style: TextStyle(color: Colors.white, fontSize: 42),)
        ),
      ),
      body: Container(
        color: Colors.deepPurple,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: studentRole,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20)
                ),
                child: Text('นักเรียน', style: TextStyle(fontSize: 40, color: Colors.black),),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: teacherRole,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20)
                ),
                child: Text('อาจารย์', style: TextStyle(fontSize: 40, color: Colors.black),),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, size: 90, color: Colors.white,)
            ],
          ),
        ),
        color: Colors.amber,
      ),
    );
  }
}