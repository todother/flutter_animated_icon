import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedIconWidget extends StatefulWidget {
  AnimatedIconWidget(
      {Key key,
      @required this.animationList,
      @required this.icon,
      @required this.size,
      this.callback,
      this.callbackDelay})
      : super(key: key);
  final List<IconAnimationStage> animationList;
  final IconData icon;
  final VoidCallback callback;
  final double size;
  final Duration callbackDelay;
  _AnimatedIconWidgetState createState() => _AnimatedIconWidgetState();
}

class _AnimatedIconWidgetState extends State<AnimatedIconWidget>
    with TickerProviderStateMixin {
  List<IconAnimationStage> anis = List<IconAnimationStage>();
  List<AnimationController> controllers = List<AnimationController>();
  List<Animation<double>> animations = List<Animation<double>>();
  Animation<double> curAnim;
  Color curColor;
  int curIndex = 0;
  List<bool> ifAdded = List<bool>();
  double curSize;
  bool ifInit = true;

  loopAnimation(index) {
    curColor = curColor == null ? anis.first.color : curColor;
    if (index < controllers.length - 1) {
      if (!ifAdded[index]) {
        animations[index] = animations[index]
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              curAnim = animations[index + 1];
              curColor = anis[index + 1].color;

              controllers[index + 1].forward(from: 0);
              loopAnimation(index + 1);
            }
          })
          ..addListener(() {
            setState(() {});
          });
        ifAdded[index] = true;
      }
    } else if (index == controllers.length - 1) {
      if (!ifAdded[index]) {
        animations[index] = animations[index]
          ..addStatusListener((status) {
            curColor = anis[index].color;
            if (status == AnimationStatus.completed) {
              if (widget.callback != null) {
                if (widget.callbackDelay == null) {
                  widget.callback();
                } else {
                  Timer(widget.callbackDelay, () {
                    widget.callback();
                  });
                }
              }
            }
          })
          ..addListener(() {
            setState(() {});
          });
        ifAdded[index] = true;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    anis = widget.animationList;

    List.generate(anis.length, (index) {
      var curAni = anis[index];
      ifAdded.add(false);
      controllers.add(
          AnimationController(vsync: this, duration: anis[index].duration));
      animations.add(Tween(begin: curAni.start, end: curAni.end)
          .animate(controllers[index]));
    });
    curAnim = animations.first;
    loopAnimation(0);
  }

  @override
  Widget build(BuildContext context) {
    print('build ${widget.key.toString()}');
    return IconButton(
      padding: EdgeInsets.all(0),
      onPressed: () {
        controllers.first.forward(from: 0);
      },
      icon: Icon(
        widget.icon,
        size: widget.size * curAnim.value,
        color: curColor,
      ),
    );
  }
}

class IconAnimationStage {
  double start;
  double end;
  Color color;
  Duration duration;

  IconAnimationStage({this.color, this.duration, this.end, this.start});
}