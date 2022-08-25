import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Home.dart';
import 'edit_task.dart';

class Description extends StatelessWidget {
  final String title, description,time1,name,time2,type1,place1,t1;

  const Description({Key key, this.title, this.description,this.time1,this.name,this.time2,this.type1,this.place1,this.t1}) : super(key: key);
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
        title: Text("View Things",  style: GoogleFonts.roboto(fontSize: 18),),

        //leading: IconButton(icon: Icon(Icons.menu, color: Colors.white70,),),
        actions: [
          IconButton(
              icon: Icon(Icons.settings,color: Colors.blueAccent,)
          )
        ],
      ),

    body: Container(

      child: Column(
          children: <Widget>[
            Container(

              decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30),bottomLeft:Radius.circular(30),bottomRight: Radius.circular(30) ), color: Colors.black54),

              padding:  EdgeInsets.all(25.120),
             // padding: EdgeInsets.symmetric(vertical: 100),
              child: Column(

                children: <Widget>[
              //    SizedBox(height: 30,),
                  Text(title, style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    letterSpacing: 0.6,
                    wordSpacing: 0.6,
                  ),),
                  SizedBox(height: 15,),
                  Text(type1, style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    letterSpacing: 0.6,
                    wordSpacing: 0.6,
                  ),),
                  SizedBox(height: 30,),

                  Row(
                    children: <Widget>[
                      Text("Description -", style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w700,
                          fontSize: 16
                      ),),
                      SizedBox(width: 160),
                      Text("Time -"+ t1, style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w700,
                          fontSize: 16
                      ),),
                                          ],
                  ),

                  SizedBox(height: 30,),
                  Text(description, style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    letterSpacing: 0.6,
                    wordSpacing: 0.6,
                  ),),
                  SizedBox(height: 80,),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => EditTask(title: title,
                                description: description,time1: time2,type1: type1,place1: place1,t1: t1,
                              )));
                             // Fluttertoast.showToast(msg: 'Delete Task Successfully');
                            },

                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: 18),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xFF930514) ,width: 3
                                  ),
                                  borderRadius: BorderRadius.circular(12)

                              ),
                              child:

                              Text("EDIT", style: TextStyle(
                                  color: Color(0xFFD2CACC),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600
                              ),),

                            ),
                          )
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            await Firestore.instance
                                .collection('tasks')
                                .doc(name)
                                .collection('mytasks')
                                .doc(time2)
                                .delete();
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return Home();}), ModalRoute.withName('/'));

                            Fluttertoast.showToast(msg: 'Delete Task Successfully');
                          },

                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 18),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xFF930514) ,width: 3
                              ),
                              borderRadius: BorderRadius.circular(12)

                          ),
                          child:

                          Text("DELETE", style: TextStyle(
                              color: Color(0xFFD2CACC),
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                          ),),

                        ),
                      ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}
