import 'package:flutter/material.dart';
import 'api.dart';

class AddClassPage extends StatefulWidget {
  const AddClassPage({super.key});

  @override
  State<AddClassPage> createState() => _AddClassPageState();
}

class _AddClassPageState extends State<AddClassPage> {
  final _classnameController = TextEditingController();
  final _informationController = TextEditingController();

  late Future<Map<String, dynamic>> apiPost;

  void submitClass() {
    String sub_name = _classnameController.text;
    String sub_des = _informationController.text;

    apiPost = apiPostSubject(sub_name, sub_des);
    apiPost.then((value) {
      final snackBar = SnackBar(
        content: Text('Successfully create subject!', style: TextStyle(color: Colors.green)),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context);
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
              'เพิ่มข้อมูลคลาส',
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
              Text('Enter Classname',
                  style: TextStyle(fontSize: 26, color: Colors.white)),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                child: TextField(
                  controller: _classnameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Classname',
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
                  controller: _informationController,
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
                onPressed: submitClass,
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20), backgroundColor: Colors.green),
                child: Text(
                  'เพิ่มคลาส',
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
