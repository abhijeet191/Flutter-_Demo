import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Home.dart';
import 'edit_task.dart';

class Description extends StatelessWidget {
  final String title, description,time1,name,time2;

  const Description({Key key, this.title, this.description,this.time1,this.name,this.time2}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Image.asset("assets/3.jpg",width: MediaQuery.of(context).size.width,fit: BoxFit.fitWidth,),
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
      Text(title, style: TextStyle(color: Colors.white70, fontSize: 35, fontWeight: FontWeight.bold),),
      SizedBox(height: 10,),
      Text(time1, style: TextStyle(color: Colors.white, fontSize: 16,),),

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

      child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30),bottomLeft:Radius.circular(30),bottomRight: Radius.circular(30) ), color: Colors.black54),


              padding: EdgeInsets.symmetric(horizontal: 24,vertical: 40),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Description -", style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w700,
                          fontSize: 20
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
                                description: description,time1: time2,
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
    )
    ],
    ),

    );
  }
}
