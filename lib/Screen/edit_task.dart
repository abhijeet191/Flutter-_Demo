
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
      String Text = "";
      String des = "";
    if(titleController.text=="")
      {
        Text=title;
      }
    else
      {
        Text=titleController.text;
      }
    if(descriptionController.text=="")
    {
      des=description;
    }
    else
    {
      des=descriptionController.text;
    }
    var time = DateTime.now();
    await FirebaseFirestore.instance
        .collection('tasks')
        .doc(name)
        .collection('mytasks')
        .doc(time1)
        .update({
      'title': Text,
      'description': des,
      'time': time1,
      'timestamp': time
    });
    Fluttertoast.showToast(msg: 'Data Update Successfuly');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D398E),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("View", style: TextStyle(color: Colors.white),),
        //leading: IconButton(icon: Icon(Icons.menu, color: Colors.white70,),),
        actions: [
        ],
      ),
      body: Column(
      children: <Widget>[
    Column(
    crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[

        Text("Edit Task", style: TextStyle(color: Colors.white70, fontSize: 35, fontWeight: FontWeight.bold),),
        SizedBox(height: 20,),

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

        child: Column(
            children: [
              SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30),bottomLeft:Radius.circular(30),bottomRight: Radius.circular(30) ), color: Colors.black54),
                child: TextField(
                  style: TextStyle(color: Colors.white,fontSize: 18),
                  controller: TextEditingController()..text = title,
                  onChanged: (text) => { titleController.text=text   },
                  //onTap: () => titleController.text=title ,


                 // controller: titleController,
                  decoration: InputDecoration(
                   //   labelText: title,

                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0),),),

                ),

              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30),bottomLeft:Radius.circular(30),bottomRight: Radius.circular(30) ), color: Colors.black54),
                child: TextField(
                  style: TextStyle(color: Colors.white,fontSize: 20),
                  controller: TextEditingController()..text = description,
                  onChanged: (text) => { descriptionController.text=text   },
                  //onTap: () => descriptionController.text=title ,
                  //controller:descriptionController,
                  decoration: InputDecoration(
                     // labelText: description,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),),),
                ),
              ),
              SizedBox(height: 10),
              Container(
                  width: 300,
                  height: 50,
                  child: GestureDetector(
                    onTap: () async {
                      updatetasktofirebase();
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return Home();}), ModalRoute.withName('/'));

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

                      Text("UPDATE", style: TextStyle(
                          color: Color(0xFFD2CACC),
                          fontSize: 25,
                          fontWeight: FontWeight.w600
                      ),),

                    ),
                  ))
            ],
          ))
    )
    ],    ),


    );
  }
}
