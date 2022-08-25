
import 'package:ToDo_flutter/Provider/TaskModel.dart';
import 'package:ToDo_flutter/Provider/ListProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ToDo_flutter/sign_in.dart';
import 'package:provider/provider.dart';

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

    TodoModel Todomodel =Provider.of(context,listen: false);
    Todomodel.addTaskInList();

  }
  @override
  Widget build(BuildContext context) {
     Provider.of<TodoModel>(context);
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    var now = new DateTime.now();
    var Formatetime = new DateFormat('d MMMM yyyy');
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    String formattedtime = Formatetime.format(now);

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

                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return FirstScreen();}), ModalRoute.withName('/'));
                  }),
              //UserAccountDrawerHeader
            ), //DrawerHeader
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
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

                                    Text(TodoModel.c1.toString(),
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18
                                    ),),
                                    SizedBox(width: 70),
                                    Text(TodoModel.c2.toString(), style: TextStyle(
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
                Container(
                  height: 330,
                  width: double.infinity,
                  color: Color(0xBAE9E6EC),
                    child: Consumer<TodoModel>(
                      builder: (context, todo,child) {
                          return ListView.builder(
                              itemCount: todo.taskList.length,
                              itemBuilder: (context, index){
                                var time = todo.taskList[index].Time;
                                return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Description(
                                                title: todo.taskList[index].title,
                                                description: todo.taskList[index].Des,
                                                time1: todo.taskList[index].Time,
                                                name: name,
                                                time2: todo.taskList[index].Time,
                                                type1: todo.taskList[index].Type,
                                                place1: todo.taskList[index].Place,
                                                t1:todo.taskList[index].T1,
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
                                        title: Text(todo.taskList[index].title, style : TextStyle(color: Colors.black87,fontSize: 20,
                                            fontWeight: FontWeight.bold),),
                                        subtitle: Text(todo.taskList[index].Des, style: TextStyle(color: Colors.black45,fontSize: 15,
                                            fontWeight: FontWeight.bold),),
                                        trailing: Text(todo.taskList[index].T1, style: TextStyle(color: Colors.black45,fontSize: 15,
                                          fontWeight: FontWeight.bold,),),
                                      ),
                                      margin: EdgeInsets.only(bottom: 8, left: 10, right: 10),
                                    ));

                              }
                          );


                      },
                    ),

                ),
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

}

