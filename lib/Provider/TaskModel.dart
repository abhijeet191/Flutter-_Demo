
class TaskModel {
 String title;
 String Des;
 String Time;
 String Type;
 String Place;
 String T1;

 String get getTitle => title;
 String get getDes => Des;
 String get getTime => Time;
 String get getType => Type;
 String get getPlace => Place;
 String get getT1 => T1;

 TaskModel(this.title, this.Des, this.Time, this.Type, this.Place, this.T1);

}

class CountModel {
 int Pcount;
 int Bcount;

 int get getTitle => Pcount;
 int get getDetail => Bcount;

 CountModel(this.Pcount, this.Bcount);

}