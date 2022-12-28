import 'dart:math';

import 'package:flutter/material.dart';
import 'package:signshine/widget/flip_card.dart';

//comes inside scaffold
/*under appbar
    body: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(32),
      child: FlipCardWidget(
        front: Image.asset('assets/kfront.png'),
        back: Image.asset('assets/aback.png'),
      ),
    )
 */

class FlipCardWidget extends StatefulWidget{
  //get the images
  final Image front;
  final Image back;

  const FlipCardWidget({
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
  bool isFront = true;
  double dragPosition = 0;
  bool isFrontStart = true;

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