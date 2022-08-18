
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
    setState(() {
     // uid = user.uid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(name),
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
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                await googleSignIn.signOut();
                Fluttertoast.showToast(msg: 'Log Out Successfully');
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return LoginPage();}), ModalRoute.withName('/'));
              }),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
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
                itemBuilder: (context, index) {
                  var time = (docs[index]['timestamp'] as Timestamp).toDate();

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                title: docs[index]['title'],
                                description: docs[index]['description'],

                              )));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          color: Color(0xC6ABBAEE),
                          borderRadius: BorderRadius.circular(10)),
                      height: 90,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(left: 20),
                                    child: Text(docs[index]['title'],
                                        style:
                                        GoogleFonts.roboto(fontSize: 20))),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 20),
                                    child: Text(
                                        DateFormat.yMd().add_jm().format(time)))
                              ]),
                          Container(
                              child:
                              IconButton(
                                  padding: const EdgeInsets.only(left: 130.0),
                                  icon: Icon(
                                    Icons.edit,
                                  ),
                                  onPressed: () async {
                                    Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => EditTask(title: docs[index]['title'],
                                      description: docs[index]['description'],time1: docs[index]['time'],
                                    )));
                                  })),
                          Container(

                              child:
                              IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                  ),
                                  onPressed: () async {
                                    await Firestore.instance
                                        .collection('tasks')
                                        .doc(name)
                                        .collection('mytasks')
                                        .doc(docs[index]['time'])
                                        .delete();
                                    Fluttertoast.showToast(msg: 'Delete Task Successfully');
                                  }))

                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
        // color: Colors.red,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.white),
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddTask()));
          }),
    );
  }
}
