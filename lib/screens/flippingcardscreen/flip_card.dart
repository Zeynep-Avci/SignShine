import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:signshine/screens/flippingcardscreen/listshufflerclass.dart';

class FlipScreen extends StatefulWidget{

  @override
  _FlipScreen createState() => _FlipScreen();
}

class _FlipScreen extends State<FlipScreen>{

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF7C4492),
          centerTitle: true,
          title: Container(
            height: 30,
            child: Image.asset('assets/fontlogo.png'),
          ),
        ),
        body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(32),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Text(
                  'Guess the letter ${lists.flippingcardsletter[0]}',
                  style: TextStyle(
                    fontFamily: 'Neatstone',
                    fontSize: 45,
                  ),
                ),
                SizedBox(height: 30),
                FlipCardWidget(
                  front: Image.asset(
                      'assets/flipping card/front/frontcard.png'),
                  back: Image.asset(lists.flippingcards[0]),
                ),
                SizedBox(height: 30,),
                FloatingActionButton(
                  backgroundColor: Color(0xFFF1D97A),
                  onPressed: () {
                    setState(() {
                      _FlipCardWidgetState.isFront= true;
                      lists.shuffle();
                    });
                  },
                  child: Text('Next', style: TextStyle(color: Colors.deepPurple)),
                )
              ],
            )
        ),
      );
}

class FlipCardWidget extends StatefulWidget{
  //get the images
  final Image front;
  final Image back;


  FlipCardWidget({
    required this.front,
    required this.back,
    Key? key,
  }) : super(key: key);

  @override
  _FlipCardWidgetState createState() => _FlipCardWidgetState();
}

class _FlipCardWidgetState extends State<FlipCardWidget>
    with SingleTickerProviderStateMixin{ //for animation controller
  late AnimationController controller;
  late Animation<double> animation;

  double dragPosition = 0;
  bool isFrontStart = true;
  static bool isFront = true;

  //for Animation
  @override
  void initState(){
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    // for whenever the animation is changing, update dragPosition and the side of the image
    controller.addListener(() {
      setState(() {
        dragPosition = animation.value;
        setImageSide();
      });
    });
  }

  // to clean up the controller, when it is not needed
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    final angle = dragPosition / 180 * pi;
    //define the rotation
    final transform = Matrix4.identity()
      ..setEntry(3, 2, 0.001) //for the 3d effect
      ..rotateY(angle);

    //displaying the images
    return GestureDetector(
      //to make the dragging easier (if dragged until the very end, the image should not go back to position; the user should not make a "bigger/forced" drag)
      onHorizontalDragStart: (details){
        controller.stop();
        isFrontStart = isFront;
      },
      //set in a setState, so the UI stays updated
      onHorizontalDragUpdate: (details) => setState(() {
        //the change when we drag horizontally
        dragPosition -=details.delta.dx;
        dragPosition %= 360;

        setImageSide();
      }),
      onHorizontalDragEnd: (details){
        //how fast the user drags
        final velocity = details.velocity.pixelsPerSecond.dx.abs();

        //same as onHorizontalDragStart
        if(velocity >=100){
          isFront = !isFrontStart;
        }

        //if dragged and let go in the middle, go back to original position
        final double end = isFront ? (dragPosition > 180 ? 360 : 0) : 180;

        animation = Tween<double>(
          begin: dragPosition,
          end: end,
        ).animate(controller);

        //animation
        controller.forward(from: 0);
      },
      child:Transform(
        transform: transform,
        alignment: Alignment.center,
        child: isFront
            ? widget.front
            : Transform(
          transform: Matrix4.identity()..rotateY(pi),
          alignment: Alignment.center,
          child: widget.back,
        ),
      ),
    );
  }

  void setImageSide(){
    if (dragPosition <= 90 || dragPosition >=270){
      isFront = true;
    } else {
      isFront = false;
    }
  }
}
