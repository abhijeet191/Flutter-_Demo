import 'package:ToDo_flutter/Screen/Description.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../sign_in.dart';
import 'TaskModel.dart';

class TodoModel extends ChangeNotifier{
  List<TaskModel> taskList = [];
  static int c1=0;
  static int c2=0;


  addTaskInList() async {
    c1=0;
    c2=0;
    List<TaskModel> newList = [];
    var data = await FirebaseFirestore.instance
        .collection('tasks')
        .doc(name)
        .collection('mytasks').get();
    for (int i = 0; i < data.docs.length; i++) {
      if(data.docs[i].data()['Type']=="Personal")
      {
         c1=c1+1;
      }
      if(data.docs[i].data()['Type']=="Business")
      {
        c2=c2+1;
      }

    TaskModel taskModel = TaskModel(data.docs[i].data()['title'],data.docs[i].data()['description'],data.docs[i].data()['time'].toString(),data.docs[i].data()['Type'],data.docs[i].data()['Place'],data.docs[i].data()['T1']);
    newList.add(taskModel);

    }



    taskList=newList;
    notifyListeners();
  }



   /* var data = await FirebaseFirestore.instance
        .collection('tasks')
        .doc(name)
        .collection('mytasks').get();
    for (int i = 0; i < data.docs.length; i++) {
      if(data.docs[i].data()['Type']=="Personal")
      {

      }
      if(data.docs[i].data()['Type']=="Business")
      {

      }
    }
    var time = (data.docs[i].data()['timestamp'] as Timestamp).toDate();
    */
    //code to do
  }

