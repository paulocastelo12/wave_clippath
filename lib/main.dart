import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
   
        primarySwatch: Colors.blue,
      ),
      home: Wave(),
    );
  }
}

class Wave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipPath(
          clipper: ClipperWave(),
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            color: Colors.green,
          ),
        ),
      ),
      
    );
  }
}

class ClipperWave extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {

    Path path = Path();

    path.lineTo(0, 30);

    var increment = size.width/4;
    var x = 0.0;
    var y = 30.0;

    while(x < size.width){
    
      x += increment;

      print(x.toString()+" -> "+(x-increment/2).toString()); 

      if(y == 30.0){
        y = 0.0;
        path.lineTo((x-increment/2), size.height/4);

        var firstControlPoint = Offset((x-increment/2)+(increment/2)/2, size.height/3.5 );
        var firstEndPoint = Offset(x, size.height/4);
        path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);
       // path.lineTo(x, size.height/2);
      }else{
        y = 30.0;
        path.lineTo((x-increment/2), 30.0);

        var secondControlPoint = Offset((x-increment/2)+(increment/2)/2, 18.0 );
        var secondEndPoint = Offset(x, 30.0);
        path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
        //path.lineTo(x, 30.0); 
      }
      
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);

    path.close();

    // path.lineTo(45, size.height/2);
    // path.lineTo(90, size.height/2);

    // path.lineTo(135, 30.0);
    // path.lineTo(180, 30.0); 

    // path.lineTo(225, size.height/2);
    // path.lineTo(270, size.height/2);

    // path.lineTo(315, 30.0);
    // path.lineTo(size.width, 30.0);

   
    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) {
    return old != this;
  }
}
