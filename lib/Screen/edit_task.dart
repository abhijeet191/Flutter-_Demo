
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ToDo_flutter/sign_in.dart';

import 'Home.dart';

class EditTask extends StatelessWidget {

  final String title, description,time1;

   EditTask({Key key, this.title, this.description, this.time1}) : super(key: key);
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  updatetasktofirebase() async {

    FirebaseAuth auth = FirebaseAuth.instance;
    //  final FirebaseUser user = await auth.currentUser;
    //  String uid = user.uid;
    var time = DateTime.now();
    await FirebaseFirestore.instance
        .collection('tasks')
        .doc(name)
        .collection('mytasks')
        .doc(time1)
        .update({
      'title': titleController.text,
      'description': descriptionController.text,
      'time': time1,
      'timestamp': time
    });
    Fluttertoast.showToast(msg: 'Data Update Successfuly');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Task')),
      body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                      labelText: title, border: OutlineInputBorder()),
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                      labelText: description,
                      border: OutlineInputBorder()),
                ),
              ),
              SizedBox(height: 10),
              Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(backgroundColor:
                    MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return Colors.purple.shade100;
                          return Theme.of(context).primaryColor;
                        })),
                    child: Text(
                      'Update Task',
                      style: GoogleFonts.roboto(fontSize: 18),
                    ),
                    onPressed: () {
                      updatetasktofirebase();
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return Home();}), ModalRoute.withName('/'));
                    },
                  ))
            ],
          )),
    );
  }
}
