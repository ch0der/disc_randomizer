import 'package:flutter/material.dart';
import 'package:infinite_listview/infinite_listview.dart';
import 'package:random_color/random_color.dart';
import 'dart:math';
import 'dart:math' as math;

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
    Disc(name: 'Buzzz SS'),
    Disc(name: 'Warden'),
    Disc(name: 'Aviar'),
    Disc(name: 'Roc'),
    Disc(name: 'Malta'),
    Disc(name: 'Leopard'),
    Disc(name: 'Patriot'),
    Disc(name: 'Stag'),
    Disc(name: 'McDoogle Choice'),
    Disc(name: 'You Choose'),
    Disc(name: 'They Choose'),
    Disc(name: 'Putter'),
    Disc(name: 'Driver'),
    Disc(name: 'Midrange'),
    Disc(name: 'Fairway'),
    Disc(name: 'Wraith'),
    Disc(name: 'Katana'),
    Disc(name: 'Teebird'),
    Disc(name: 'Firebird'),
    Disc(name: 'OG Beast'),


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
        mainAxisAlignment: MainAxisAlignment.center,
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
      height: 700,
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification){
          if(scrollNotification is ScrollEndNotification){
            print('$scrollNotification');
          }
          return true;

        },
        child: ListWheelScrollView.useDelegate(
          physics: CustomScrollPhysics(),
          useMagnifier: true,
          magnification: 1.5,


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
  final double initPosition;
  final double velocity;


  CustomSim(this.initPosition, this.velocity);

  @override
  double x(double time) {
    Random rand = Random();
    var num = 1+rand.nextInt(50);
    var test = initPosition+(velocity)*time;
   return test;
}


  @override
  bool isDone(double time) {
    Random rand = Random();
    var num = 1+rand.nextInt(5);

    if(time<1+num){
      return false;
    } else return true;

  }

  @override
  double dx(double time) {
    Random rand = Random();
    var num = rand.nextInt(5);


    return velocity+num;

  }
}

class CustomScrollPhysics extends ScrollPhysics{


  @override
  ScrollPhysics applyTo(ScrollPhysics ancestor) {
    return CustomScrollPhysics();

  }

  @override
  double carriedMomentum(double existingVelocity) {

  }

  @override
  Simulation createBallisticSimulation(ScrollMetrics position,
      double velocity) {
    Random rand = Random();
    var num = rand.nextInt(100);
    var randVel = (1-(1/(.05+num)));
    return CustomSim(position.pixels, velocity);


  }
}
