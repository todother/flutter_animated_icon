import 'package:animated_icon/AnimatedIconWidget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build MyApp");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("AnimatedIcon"),
          
        ),
        body:Center(child:Home()) ,
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build home");
    return Container(
      child: getButtonList(context),
    );
  }
}

getButtonList( BuildContext context) {
  List<IconAnimationStage> stages1 = List<IconAnimationStage>();
  stages1.add(IconAnimationStage(
      color: Colors.grey[500],
      start: 1.0,
      end: 0.0,
      duration: Duration(milliseconds: 200)));
  stages1.add(IconAnimationStage(
      color: Colors.redAccent,
      start: 0.0,
      end: 1.3,
      duration: Duration(milliseconds: 300)));
  stages1.add(IconAnimationStage(
      color: Colors.redAccent,
      start: 1.3,
      end: 1.0,
      duration: Duration(milliseconds: 100)));

  List<IconAnimationStage> stages2 = List<IconAnimationStage>();
  stages2.add(IconAnimationStage(
      color: Colors.grey[500],
      start: 1.0,
      end: 1.2,
      duration: Duration(milliseconds: 200)));
  stages2.add(IconAnimationStage(
      color: Colors.grey[500],
      start: 1.2,
      end: 1.0,
      duration: Duration(milliseconds: 200)));

  List<IconAnimationStage> stages3 = List<IconAnimationStage>();
  stages3.add(IconAnimationStage(
      color: Colors.redAccent,
      start: 1.0,
      end: 1.2,
      duration: Duration(milliseconds: 200)));
  stages3.add(IconAnimationStage(
      color: Colors.grey[500],
      start: 1.2,
      end: 1.0,
      duration: Duration(milliseconds: 200)));
  double iconSize = 70 ;
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      AnimatedIconWidget(
          key: Key("1"),
          animationList: stages1,
          icon: Icons.favorite,
          size: iconSize,
          callback: () {
            
          }),
      AnimatedIconWidget(
        key: Key("2"),
        animationList: stages3,
        icon: Icons.favorite,
        size: iconSize,
        callback: () {
          
        },
      ),
      AnimatedIconWidget(
        key: Key("3"),
        animationList: stages2,
        icon: Icons.comment,
        size: iconSize,
        callbackDelay: Duration(milliseconds: 200),
        callback: () {
          showBottom(context);
        },
      ),
      AnimatedIconWidget(
        key: Key("4"),
        animationList: stages2,
        icon: Icons.reply,
        size: iconSize,
      ),
    ],
  );
}

showBottom(context) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(10)),
      context: context,
      builder: (_) {
        return Container(
          height: 600,
          child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Container()),
        );
      });
}
