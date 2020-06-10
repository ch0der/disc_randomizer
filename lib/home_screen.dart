import 'package:flutter/material.dart';
import 'package:infinite_listview/infinite_listview.dart';
import 'package:random_color/random_color.dart';

class HomeScreen2 extends StatefulWidget {
  @override
  _HomeScreen2State createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  ScrollPhysics customScroll = ScrollPhysics();
  bool scrollEnded = false;

  List<Disc> discList = [
    Disc(name: 'Sol'),
    Disc(name: 'Hades'),
    Disc(name: 'Buzzz'),
    Disc(name: 'Thrasher'),
    Disc(name: 'Sheriff'),
    Disc(name: 'Crank'),
    Disc(name: 'Warden'),
    Disc(name: 'Bard'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  body() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          discWheel3(),
        ],
      ),
    );
  }

  discWheel() {
    return Container(
      height: 200,
      child: ListView.separated(
          separatorBuilder: (_, __) => Container(
                height: 50,
              ),
          itemCount: discList.length,
          itemBuilder: (context, index) {
            final item = discList[index];
            return Container(
              color: RandomColor().randomColor(),
              height: 20,
              width: 100,
              child: Center(
                child: Text(item.name),
              ),
            );
          }),
    );
  }

  discWheel2() {
    return Container(
      height: 300,
      child: ListWheelScrollView.useDelegate(
        itemExtent: 50,
        childDelegate: ListWheelChildBuilderDelegate(
            childCount: discList.length,
            builder: (context, index) {
              final item = discList[index];
              return Container(
                color: Colors.lightGreen
                    .withOpacity(1 - (1 / (item.name.length.toDouble()))),
                height: 20,
                width: 100,
                child: Center(
                  child: Text(item.name),
                ),
              );
            }),
      ),
    );
  }

  discWheel3() {
    String disc = "";
    final items = discList;
    return Container(
      height: 500,
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification){
          if(scrollNotification is ScrollEndNotification){
            print('$scrollNotification');
          }
          return true;

        },
        child: ListWheelScrollView.useDelegate(
          physics: customScroll,


          itemExtent: 60,
          childDelegate: ListWheelChildLoopingListDelegate(
            children: List.generate(items.length, (index) {
              final item = discList[index];
              return Container(
                color: RandomColor().randomColor( colorBrightness: ColorBrightness.light,),
                height: 10,
                width: 250,
                child: Center(
                  child: Text(item.name,style: TextStyle(color: Colors.white,fontSize: 30),),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class Disc {
  String name;
  String image;

  Disc({this.name, this.image});
}
class CustomSim extends Simulation{

  @override
  double x(double time) {

  }


  @override
  bool isDone(double time) {

  }

  @override
  double dx(double time) {

  }
}

class CustomScrollPhysics extends ScrollPhysics{

  @override
  ScrollPhysics applyTo(ScrollPhysics ancestor) {

  }

  @override
  double carriedMomentum(double existingVelocity) {

  }
}
