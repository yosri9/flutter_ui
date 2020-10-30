import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Registration3 extends StatefulWidget {
  @override
  _Registration3State createState() => _Registration3State();
}

class _Registration3State extends State<Registration3> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily
      ),
      child: Stack(
        children: <Widget>[
          Image.asset(
            'assets/registration/registration3.jpg',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.6,
          ),
          Opacity(
            opacity: 0.5,
            child: CustomPaint(
              painter: Background(
                leftPoint: 0.35,
                rightPoint: 0.4,
                midPoint1: 0.7,
                midPoint2: 0.6,
              ),
              child: Container(),
            ),
          ),
          CustomPaint(
            painter: Background(
                leftPoint: 0.45,
                rightPoint: 0.5,
                midPoint1: 0.71,
                midPoint2: 0.61),
            child: Container(),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Padding(
              padding:  EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.start ,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text('Login to start',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                    letterSpacing: 1.2
                  ),
                  ),

                  _form(context),
                  SizedBox(height: 32,),
                  _actions(context),
                  SizedBox(height: 10,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

 Widget _form(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
          child: Form(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 55,
                ),
                TextFormField(
                  style: TextStyle(
                      color: Colors.white
                  ),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Email',
                    labelStyle: TextStyle(
                        color: Colors.white
                    ),
                    hintStyle: TextStyle(
                        color: Colors.white
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.white)),

                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Password',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    hintStyle: TextStyle(
                        color: Colors.white
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.white)),


                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(0,56),
          child: InkWell(
            child: Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                color: Color(0xFFF9C660),
                shape: BoxShape.circle
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                    'GO',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.1
                  ),
                ),
              ),

            ),
          ),
        ),
      ],
    );
 }
 Color _buttonColor = Color(0xFFF9EA60);
 Widget _actions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FlatButton(
          padding: EdgeInsets.zero,
          onPressed: (){},
          child: Text(
            'Forgot password',
            style: TextStyle(
              color: _buttonColor,
              letterSpacing: 1.2
            ),
          ),
        ),
        FlatButton(
          onPressed: (){},
          child: Text(
              'Sign Up',
              style: TextStyle(
                color: _buttonColor,
                letterSpacing: 1.2
              ),
          ),
        )
      ],
    );
 }
}


class Background extends CustomPainter {
  final double leftPoint;
  final double rightPoint;
  final double midPoint1;
  final double midPoint2;

  Background({this.leftPoint, this.rightPoint, this.midPoint1, this.midPoint2});

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    Gradient gradient = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.topRight,
        colors: [Color(0xFFFF3181), Color(0xFFFA7537)],
        stops: [0.5, 0.9]);

    Paint paint = Paint();
    paint.shader = gradient.createShader(rect);
    Path path = Path();
    path.lineTo(0, size.height * leftPoint);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * rightPoint);
    path.lineTo(size.width * midPoint1, size.height * midPoint2);
    path.lineTo(0, size.height * leftPoint);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
