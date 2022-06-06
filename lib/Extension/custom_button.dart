import 'package:flutter/material.dart';

class CustomButton extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color =  Colors.purple.shade400
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;


    Path path0 = Path();
    path0.moveTo(size.width*0.4450000,size.height*0.0250000);
    path0.lineTo(size.width*0.5019000,0);
    path0.lineTo(size.width*0.5500000,size.height*0.0200000);
    path0.lineTo(size.width*0.9254500,size.height*0.2037500);
    path0.lineTo(size.width*0.9561500,size.height*0.2552500);
    path0.lineTo(size.width*0.9549000,size.height*0.7450000);
    path0.lineTo(size.width*0.9323500,size.height*0.7931000);
    path0.lineTo(size.width*0.5843000,size.height*0.9692500);
    path0.lineTo(size.width*0.5038000,size.height);
    path0.lineTo(size.width*0.4336000,size.height*0.9712000);
    path0.lineTo(size.width*0.0867500,size.height*0.8006500);
    path0.lineTo(size.width*0.0419500,size.height*0.7450000);
    path0.lineTo(size.width*0.0419000,size.height*0.2824500);
    path0.lineTo(size.width*0.0955500,size.height*0.2114500);
    path0.lineTo(size.width*0.4450000,size.height*0.0250000);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
