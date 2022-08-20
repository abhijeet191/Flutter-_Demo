
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ToDo_flutter/sign_in.dart';

import '../login_page.dart';
import 'Description.dart';
import 'add_task.dart';
import 'edit_task.dart';
import 'first_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String uid = '';

  @override
  void initState() {
    getuid();
    super.initState();
  }

  getuid() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    // final FirebaseUser user = await auth.currentUser;

  }

  @override
  Widget build(BuildContext context) {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    return Scaffold(
      backgroundColor: Color(0xFF2D398E),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Welcome "+name, style: TextStyle(color: Colors.white),),
        leading: IconButton(icon: Icon(Icons.menu, color: Colors.white70,),),
        actions: [
          IconButton(
              icon: CircleAvatar(
                backgroundImage: NetworkImage(
                  imageUrl,
                ),
                radius: 20,
                backgroundColor: Colors.transparent,
              ),
              onPressed: () async {
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return FirstScreen();}), ModalRoute.withName('/'));
              }),

        ],
      ),
    body: Column(
    children: <Widget>[
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    SizedBox(height: 20,),

    Text(DateFormat.Hms().format(DateTime.now()).toString(), style: TextStyle(color: Colors.white70, fontSize: 45, fontWeight: FontWeight.bold),),

    Text("             "+formattedDate.toString(), style: TextStyle(color: Colors.white, fontSize: 16,),),

    SizedBox(height: 20,),

    ],
    ), //to show the clock

    Expanded(
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          image: DecorationImage(
              image: AssetImage('assets/2.jpg'),
              fit: BoxFit.cover)),padding: EdgeInsets.all(10),
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('tasks')
              .doc(name)
              .collection('mytasks')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {

              final docs = snapshot.data.documents;


              return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, index){
                    var time = (docs[index]['timestamp'] as Timestamp).toDate();
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Description(
                                    title: docs[index]['title'],
                                    description: docs[index]['description'],
                                    time1: DateFormat.yMd().add_jm().format(time).toString(),
                                    name: name,
                                    time2: docs[index]['time'],

                                  )));
                        },

                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(30)),
                      height: 90,
                      child: ListTile(

                        contentPadding: EdgeInsets.only(left: 25, right: 32, top: 8, bottom: 8),
                        title: Text(docs[index]['title'], style : TextStyle(color: Colors.black87,fontSize: 20,
                            fontWeight: FontWeight.bold),),
                        subtitle: Text(DateFormat.yMd().add_jm().format(time).toString(), style: TextStyle(color: Colors.black45,fontSize: 15,
                            fontWeight: FontWeight.bold),),

                        trailing: Icon(Icons.check_circle, color: Colors.greenAccent,),
                      ),
                      margin: EdgeInsets.only(bottom: 8, left: 10, right: 10),
                    ));
                  }
              );


            }
          },
        ),
        // color: Colors.red,
      ),
    )
      ],
    ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.white),
          backgroundColor: Color(0xFF2D398E),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddTask()));
          }),
    );
  }
}
