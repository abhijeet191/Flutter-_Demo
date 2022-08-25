
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
  TextEditingController Place = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController T1 = TextEditingController();
  // Initial Selected Value
  String dropdownvalue = 'Personal';

  // List of items in our dropdown menu
  var items = [
    'Personal',
    'Business',
  ];
  addtasktofirebase() async {
    FirebaseAuth auth = FirebaseAuth.instance;
  //  final FirebaseUser user = await auth.currentUser;
  //  String uid = user.uid;
    var time = DateTime.now();
    await FirebaseFirestore.instance
        .collection('tasks').doc(name).collection('mytasks').doc(time.toString())
        .set({
      'title': titleController.text,
      'description': descriptionController.text,
      'time': time.toString(),
      'timestamp': time,
      'Place': Place.text,
      'Type': type.text,
      'T1' : T1.text



    });
    Fluttertoast.showToast(msg: 'Data Added');
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return Home();}), ModalRoute.withName('/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // set it to fal
      backgroundColor: Color(0xFD534797),

      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.blueAccent, //change your color here
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text("Add New Things",  style: GoogleFonts.roboto(fontSize: 18)),
        //leading: IconButton(icon: Icon(Icons.menu, color: Colors.white70,),),
        actions: [
          IconButton(
              icon: Icon(Icons.settings,color: Colors.blueAccent,)
          )
        ],
      ),
    body: Container(
       // padding: EdgeInsets.symmetric(horizontal: 25,vertical: 30),
        padding:  EdgeInsets.all(25.0),
          child: Column(
            children: [
              Image(image: AssetImage("assets/addnew.png"), height: 50.0),

              SizedBox(height: 60),
              Container(

                child: new Column(
                  children: [
                     // padding: const EdgeInsets.all(25.0),
                       new Row(
                        children: <Widget>[
                          new Expanded(
                              child: TextField(
                                style: TextStyle(color: Colors.white,fontSize: 18),
                                controller: type,

                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white70),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white70),
                                  ),
                                  hintText: "Select Category",
                                  hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
                                ),
                              ),

                          ),

                          new PopupMenuButton<String>(

                            icon:  Icon(Icons.arrow_drop_down,color: Colors.grey,),

                            onSelected: (String value) {
                              type.text = value;
                            },
                            itemBuilder: (BuildContext context) {

                              return items.map<PopupMenuItem<String>>((String value) {

                                return new PopupMenuItem(child: new Text(value), value: value);
                              }).toList();
                            },
                          ),

                        ],

                      ),

                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(

                //decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30),bottomLeft:Radius.circular(30),bottomRight: Radius.circular(30) ), color: Colors.black54),
                child: TextField(
                  style: TextStyle(color: Colors.white,fontSize: 18),
                  controller: titleController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                    hintText: "Task Name",
                    hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
                  ),
                ),

              ),
              SizedBox(height: 10),
              Container(

                //decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30),bottomLeft:Radius.circular(30),bottomRight: Radius.circular(30) ), color: Colors.black54),
                child: TextField(
                  style: TextStyle(color: Colors.white,fontSize: 18),
                  controller: Place,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                    hintText: "Place",
                    hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
                  ),
                ),

              ),
              SizedBox(height: 10),

              Container(

                //decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30),bottomLeft:Radius.circular(30),bottomRight: Radius.circular(30) ), color: Colors.black54),
                child: TextField(
                  style: TextStyle(color: Colors.white,fontSize: 18),
                  controller: T1,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                    hintText: "Time",
                    hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
                  ),
                ),

              ),
              SizedBox(height: 10),
              Container(
                //decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30),bottomLeft:Radius.circular(30),bottomRight: Radius.circular(30) ), color: Colors.black54),


                child: TextField(
                  style: TextStyle(color: Colors.white,fontSize: 18),
                  controller: descriptionController,
                    decoration: InputDecoration(
               //       contentPadding: const EdgeInsets.symmetric(vertical: 40.5),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white70),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white70),
                      ),
                  hintText: "Description",
                      hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
               //   contentPadding: const EdgeInsets.all(20.0),

             ),
                )
              ),
              SizedBox(height: 10),
              Container(
                  width: 350,
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
                      'Add Task',
                      style: GoogleFonts.roboto(fontSize: 18),
                    ),
                    onPressed: () {
                      addtasktofirebase();

                    },
                  ))
            ],
          )),

    );
  }
}
