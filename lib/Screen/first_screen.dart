
import 'package:ToDo_flutter/Screen/Home.dart';
import 'package:flutter/material.dart';
import 'package:ToDo_flutter/login_page.dart';
import 'package:ToDo_flutter/sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF2D398E),
        appBar: AppBar(

          backgroundColor: Colors.transparent,
          elevation: 0,

        //leading: IconButton(icon: Icon(Icons.menu, color: Colors.white70,),),
        actions: [
        ],
    ),
    body: Column(
    children: <Widget>[
    Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[

    Text("About", style: TextStyle(color: Colors.white70, fontSize: 35, fontWeight: FontWeight.bold),),
    SizedBox(height: 20,),

    ],
    ), //to show the clock

    Expanded(
    child:Container(

      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          image: DecorationImage(
              image: AssetImage('assets/8.jpg'),
              fit: BoxFit.cover)),padding: EdgeInsets.all(10),

      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(
                  imageUrl,
                ),
                radius: 100,
                backgroundColor: Colors.transparent,
              ),
              SizedBox(height: 40),
              Text(
                'NAME',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF930514)),
              ),
              SizedBox(height: 15),
              Text(
                name,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white60,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20),
              Text(
                'EMAIL',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF930514)),
              ),
              Text(
                email,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white60,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 40),

              Container(
                  width: 300,
                  height: 50,
                  child: GestureDetector(
                    onTap: () async {
                      signOutGoogle();
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return LoginPage();}), ModalRoute.withName('/'));
                       Fluttertoast.showToast(msg: 'LogOut Successfully');
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

                      Text("SIGNOUT", style: TextStyle(
                          color: Color(0xFFD2CACC),
                          fontSize: 25,
                          fontWeight: FontWeight.w600
                      ),),

                    ),
                  ))
            ],
          ),
        ),
      ),
    )
        ],
    )
    );
  }
}
