
import 'package:ToDo_flutter/Screen/Description.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ToDo_flutter/sign_in.dart';

import 'Home.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  addtasktofirebase() async {
    FirebaseAuth auth = FirebaseAuth.instance;
  //  final FirebaseUser user = await auth.currentUser;
  //  String uid = user.uid;
    var time = DateTime.now();
    await FirebaseFirestore.instance
        .collection('tasks')
        .doc(name)
        .collection('mytasks')
        .doc(time.toString())
        .set({
      'title': titleController.text,
      'description': descriptionController.text,
      'time': time.toString(),
      'timestamp': time
    });
    Fluttertoast.showToast(msg: 'Data Added');
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return Home();}), ModalRoute.withName('/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D398E),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Home", style: TextStyle(color: Colors.white),),
        //leading: IconButton(icon: Icon(Icons.menu, color: Colors.white70,),),
        actions: [
        ],
      ),
    body: Column(

    children: <Widget>[
    Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
    SizedBox(height: 10,),
    //Spacer(),
    Text("Add New Task", style: TextStyle(color: Colors.white70, fontSize: 35, fontWeight: FontWeight.bold),),
    SizedBox(height: 10,),

    ],
    ), //to show the clock

    Expanded(
    child:Container(

        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            image: DecorationImage(
                image: AssetImage('assets/5.jpg'),
                fit: BoxFit.cover)),padding: EdgeInsets.all(10),

//        padding: EdgeInsets.all(20),
          child: Column(


          //  padding: EdgeInsets.symmetric(horizontal: 24,vertical: 40),

            children: [
              SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30),bottomLeft:Radius.circular(30),bottomRight: Radius.circular(30) ), color: Colors.black54),
                child: TextField(
                  style: TextStyle(color: Colors.white,fontSize: 20),
                  controller: titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0),),
                    hintText: "Task Name",
                    hintStyle: TextStyle(fontSize: 20.0, color: Colors.white70),
                  ),
                ),

              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30),bottomLeft:Radius.circular(30),bottomRight: Radius.circular(30) ), color: Colors.black54),

                child: TextField(
                  style: TextStyle(color: Colors.white,fontSize: 20),
                  controller: descriptionController,
                    decoration: InputDecoration(
               //       contentPadding: const EdgeInsets.symmetric(vertical: 40.5),
                border: OutlineInputBorder(

                borderRadius: BorderRadius.circular(30.0),
              ),
                  hintText: "   Description",
                      hintStyle: TextStyle(fontSize: 20.0, color: Colors.white70),
               //   contentPadding: const EdgeInsets.all(20.0),

    ),
                )
              ),
              SizedBox(height: 10),
              Container(
                  width: 300,
                  height: 50,
                  child: GestureDetector(
                    onTap: () async {
                      if(titleController.text=="")
                      {
                        Fluttertoast.showToast(msg: "Please Add Task");
                      }
                      else
                      {
                        addtasktofirebase();
                      }

                      // Fluttertoast.showToast(msg: 'Delete Task Successfully');
                    },

                    child: Container(
                      alignment: Alignment.center,
                      //padding: EdgeInsets.symmetric(vertical: 18),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(0xFF930514) ,width: 4
                          ),
                          borderRadius: BorderRadius.circular(12)

                      ),
                      child:

                      Text("ADD TASK", style: TextStyle(
                          color: Color(0xFFD2CACC),
                          fontSize: 25,
                          fontWeight: FontWeight.w600
                      ),),

                    ),
                  ))
            ],
          )),
    )
        ],),
    );
  }
}
