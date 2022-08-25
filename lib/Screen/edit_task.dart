
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ToDo_flutter/sign_in.dart';

import 'Home.dart';

class EditTask extends StatelessWidget {

  final String title, description,time1,type1,place1,t1;

   EditTask({Key key, this.title, this.description, this.time1,this.type1,this.place1,this.t1}) : super(key: key);
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController Place = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController T1 = TextEditingController();
  var items = [
    'Personal',
    'Bussness',
  ];
  updatetasktofirebase() async {

    FirebaseAuth auth = FirebaseAuth.instance;
    //  final FirebaseUser user = await auth.currentUser;
      String Text = "";
      String des = "";
    String ty1 = "";
    String pl1 = "";
    String ti1 = "";
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
    if(type.text=="")
    {
      ty1=type1;
    }
    else
    {
      ty1=type.text;
    }
    if(Place.text=="")
    {
      pl1=place1;
    }
    else
    {
      pl1=Place.text;
    }
    if(T1.text=="")
    {
      ti1=t1;
    }
    else
    {
      ti1=T1.text;
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
      'timestamp': time,
      'Place': pl1,
      'Type': ty1,
      'T1' : ti1

    });
    Fluttertoast.showToast(msg: 'Data Update Successfuly');

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
          title: Text("Edit Things", style: GoogleFonts.roboto(fontSize: 18)),
          //leading: IconButton(icon: Icon(Icons.menu, color: Colors.white70,),),
          actions: [
            IconButton(
                icon: Icon(Icons.settings,color: Colors.blueAccent,)
            )
          ],
        ),
      body:Container(

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
                            readOnly: true,
                            style: TextStyle(color: Colors.white,fontSize: 16),
                            controller: TextEditingController()..text = type1,
                            onChanged: (text) => { type.text=text   },

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



                      ],

                    ),

                  ],
                ),
              ),

              SizedBox(height: 10),
              Container(
                //decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30),bottomLeft:Radius.circular(30),bottomRight: Radius.circular(30) ), color: Colors.black54),
                child: TextField(
                  style: TextStyle(color: Colors.white,fontSize: 16),
                  controller: TextEditingController()..text = title,
                  onChanged: (text) => { titleController.text=text   },
                  //onTap: () => titleController.text=title ,

                  // controller: titleController,
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
                  style: TextStyle(color: Colors.white,fontSize: 16),
                  controller: TextEditingController()..text = place1,
                  onChanged: (text) => { Place.text=text   },
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
                  style: TextStyle(color: Colors.white,fontSize: 16),
                  controller: TextEditingController()..text = t1,
                  onChanged: (text) => { T1.text=text   },
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
             //   decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30),bottomLeft:Radius.circular(30),bottomRight: Radius.circular(30) ), color: Colors.black54),
                child: TextField(
                  style: TextStyle(color: Colors.white,fontSize: 16),
                  controller: TextEditingController()..text = description,
                  onChanged: (text) => { descriptionController.text=text   },
                  //onTap: () => descriptionController.text=title ,
                  //controller:descriptionController,
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

                ),
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
                      'Edit Task',
                      style: GoogleFonts.roboto(fontSize: 18),
                    ),
                    onPressed: () {
                      updatetasktofirebase();
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return Home();}), ModalRoute.withName('/'));
                    },
                  ))
            ],
          ))


    );
  }
}
