
import 'package:ToDo_flutter/Provider/TaskModel.dart';
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
import 'FadeAnimation.dart';
import 'add_task.dart';
import 'edit_task.dart';
import 'first_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String uid = '';
  static int ty=0;
  static int ty11=0;

  @override
  void initState() {

    getuid();
    super.initState();

    // Navigator.pop(context);
  }
  @override
  void dispose() {


    super.dispose();
  }

  void getuid() async {
    ty=0;
    ty11=0;
      var data = await FirebaseFirestore.instance
          .collection('tasks')
          .doc(name)
          .collection('mytasks').get();
        for (int i = 0; i < data.docs.length; i++) {
            if(data.docs[i].data()['Type']=="Personal")
            {
              setState(() {
                ty=ty+1;
              });
            }
           if(data.docs[i].data()['Type']=="Business")
           {
          setState(() {
            ty11=ty11+1;
          });
        }
        }

  }
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    var now = new DateTime.now();
    var Formatetime = new DateFormat('d MMMM yyyy');
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    String formattedtime = Formatetime.format(now);
    String Taskcount1="0";
    String Taskcount2="0";
    return Scaffold(
      resizeToAvoidBottomInset: false,
     key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
             DrawerHeader(
               decoration: BoxDecoration(
                 color: Colors.blue,
               ),
             child: IconButton(
                  icon: CircleAvatar(
                    backgroundImage: NetworkImage(
                      imageUrl,
                    ),
                    radius: 40,
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: () async {
                    setState(() {
                      ty=0;
                      ty11=0;
                    });
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return FirstScreen();}), ModalRoute.withName('/'));
                  }),
              //UserAccountDrawerHeader
            ), //DrawerHeader
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                setState(() {
                  ty=0;
                  ty11=0;
                });
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return FirstScreen();}), ModalRoute.withName('/'));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                googleSignIn.signOut();
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return LoginPage();}), ModalRoute.withName('/'));
                Fluttertoast.showToast(msg: 'LogOut Successfully');
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 275,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/16.jpg'),
                    )
                ),
                child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[

                      Container(
                        child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.menu,
                                      color: Colors.white,
                                      size: 30),
                                  onPressed: (){
                                    _scaffoldKey.currentState.openDrawer();
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                FadeAnimation(
                                    1,
                                    Text(
                                      "Your \nThings",
                                      style: GoogleFonts.roboto(color: Colors.white,fontSize: 40,  fontWeight: FontWeight.w300, letterSpacing: 2.0  ),
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                FadeAnimation(
                                    1,
                                    Text(
                                      formattedtime,
                                      style: GoogleFonts.roboto(color: Colors.white,fontSize: 15,  fontWeight: FontWeight.w300, letterSpacing: 2.0  ),
                                    )),
                                SizedBox(
                                  height: 50,
                                ),
                              ],
                            )
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(color: Colors.black26),
                        child: Padding(
                            padding:  EdgeInsets.all(25.120),
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(

                                  children: <Widget>[
                                    SizedBox(width: 40),

                                    Text(ty.toString(),
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18
                                    ),),
                                    SizedBox(width: 70),
                                    Text(ty11.toString(), style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18
                                    ),),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text("Personal", style: TextStyle(
                                        color: Colors.white70,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 16
                                    ),),
                                    SizedBox(width: 10),
                                    Text("Bussness", style: TextStyle(
                                        color: Colors.white70,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 16
                                    ),),
                                  ],
                                ),


                              ],
                            )
                        ),
                      ),

         ],
        ),
              /*  child: Container(

                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      FadeAnimation(
                          1,
                          Text(
                            "Your \nThings",
                              style: GoogleFonts.roboto(color: Colors.white,fontSize: 40,  fontWeight: FontWeight.w300, letterSpacing: 2.0  ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                          1,
                          Text(
                            formattedtime,
                            style: GoogleFonts.roboto(color: Colors.white,fontSize: 15,  fontWeight: FontWeight.w300, letterSpacing: 2.0  ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                  ),
                ),*/
              ),
            //  SizedBox(height: 20,),
              Expanded(

                child: new Column(
                  children: [
               Container(
                      height: 50,

                      width: double.infinity,
                      color: Color(0xBAE9E6EC),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 15,0, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[

                            Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: Text(
                                'INBOX',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      // color: Colors.red,
                    ),
              Add(),
                  ],),

              )
            ],
          ),
        ),
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
  Add(){
    return  Container(
      height: 330,
      width: double.infinity,
      color: Color(0xBAE9E6EC),
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
          }
          else {
            ty=0;
            ty11=0;
            final docs = snapshot.data.documents;
            return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (context, index){


                  //           Fluttertoast.showToast(msg: ty11.toString());
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
                                  type1: docs[index]['Type'],
                                  place1: docs[index]['Place'],
                                  t1: docs[index]['T1'],
                                )));

                      },

                      child: Container(

                        decoration: BoxDecoration(
                          // color: Colors.black26,
                          //    borderRadius: BorderRadius.circular(30)
                          border: Border(
                            bottom: BorderSide(width: 0.4, color: Colors.black54),
                          ),
                        ),
                        height: 70,
                        child: ListTile(
                          leading: Image(image: AssetImage("assets/addnew.png"), height: 50.0),
                          contentPadding: EdgeInsets.only(left: 25, right: 32, top: -1, bottom: 8),
                          title: Text(docs[index]['title'], style : TextStyle(color: Colors.black87,fontSize: 20,
                              fontWeight: FontWeight.bold),),
                          subtitle: Text(docs[index]['description'], style: TextStyle(color: Colors.black45,fontSize: 15,
                              fontWeight: FontWeight.bold),),
                          trailing: Text(docs[index]['T1'], style: TextStyle(color: Colors.black45,fontSize: 15,
                            fontWeight: FontWeight.bold,),),
                        ),
                        margin: EdgeInsets.only(bottom: 8, left: 10, right: 10),
                      ));
                  setState(() {});
                }
            );

          }
        },
      ),
      // color: Colors.red,
    );

  }
}

