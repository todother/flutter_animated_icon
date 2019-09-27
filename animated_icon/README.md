# animated_icon

This is a light weighted widget for you to establish your own animated icon in flutter.

Is it easy to use? Please watch the guide.

## Getting Started

What can I do with the widget? Need to write down an animation by myself?<br/>

<b>THIS IS A BIG NO NEED</b>. What you need to provide is just as simple as <b>HELLO WORLD</b>.

First of all, let's see a demo for this.

<image src="https://github.com/todother/flutter_animated_icon/blob/master/animated_icon/images/Sep-27-2019%2009-51-44.gif?raw=true"></image>

## How to use

First of all, you need to imagine your animation, determine the duration, color, scale size for each <b>stage</b>.<br/>

   Wait a minute! what does stage means?
   
   Like the gif shows, the first favorite Icon. I have splited it into 3 stages.
   
   1st --- size from 1.0 to 0.0 and color from Colors.grey[500] to Colors.redAccent<br/><br/>
   2nd --- size from 0.0 to 1.3 and color from Colors.redAccent to Colors.redAccent<br/><br/>
   3rd --- size from 1.3 to 1.0 and color from Colors.redAccent to Colors.redAccent <br/><br/>
   
   ### the double size here means times, like the original size is 30, the animation will scale it to 30--0--39--30
   
## How to accomplish in this widget?

<b>1. You need to new an object from <b>IconAnimationStage</b> class </b>

  class IconAnimationStage {<br/>
    double start; //start size<br/>
    double end;   //end size<br/>
    Color color;  //color in this stage<br/>
    Duration duration;  //duration for stage<br/>

  IconAnimationStage({this.color, this.duration, this.end, this.start});<br/>
}
<br/>
Like the demo above, I need to new 3 stages.

List< IconAnimationStage > stages = List< IconAnimationStage>();<br/><br/>
  stages.add(IconAnimationStage(<br/>
      color: Colors.grey[500],<br/>
      start: 1.0,<br/>
      end: 0.0,<br/>
      duration: Duration(milliseconds: 200)));<br/><br/>
  stages.add(IconAnimationStage(<br/>
      color: Colors.redAccent,<br/>
      start: 0.0,<br/>
      end: 1.3,<br/>
      duration: Duration(milliseconds: 300)));<br/><br/>
  stages.add(IconAnimationStage(<br/>
      color: Colors.redAccent,<br/>
      start: 1.3,<br/>
      end: 1.0,<br/>
      duration: Duration(milliseconds: 100)));<br/><br/>


<b>2. You can use the widget to show animations </b>
  
   AnimatedIconWidget(<br/>
        key: UniqueKey(),<br/>
        animationList: stages,  // pass the animation here<br/>
        icon: Icons.favorite,<br/>
        size: 40,               //initial value <br/>
      )<br/>
   
   You could wrap it into a Container or sth else, click on it and your self-made animation will begin to work.

## Want more???

OK~I have provided some other params to let you do more.

like:

<ul>
<li>Call Back Function</li> 
<li>Delay for Call Back Function</li> 
</ul>
  
## How To Use??

Like the 3rd Icon in gif, you could wait for the animation to finish and 200ms more delay then popup the bottom sheet.

AnimatedIconWidget(<br/>
        animationList: stages2,<br/>
        icon: Icons.comment,<br/>
        size: iconSize,<br/>
        callbackDelay: Duration(milliseconds: 200),<br/>
        callback: () {<br/>
          showBottom(context);<br/>
        },<br/>
)<br/>
    
