import 'package:flutter/cupertino.dart';
import 'package:flutterui/profiles/profiles_3/provider.dart';
import 'package:flutterui/profiles/profiles_3/user.dart';
import 'package:flutter/material.dart';

class Profile3 extends StatefulWidget {
  @override
  _Profile3State createState() => _Profile3State();
}

class _Profile3State extends State<Profile3> {
  Profile _profile = ProfileProvider.getProfile();
  static Color _textColor = Color(0xFF4e4e4e);
  bool _visible = false;
  bool _visible2 = false;
  
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 500),(){
      setState(() {
        _visible = true;
      });
    });
    Future.delayed(Duration(seconds: 1) , (){
      setState(() {
        _visible2 = true;
      });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset('assets/profiles/profile_3.jpg' ,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: (){},
              icon: Icon(Icons.arrow_back),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: (){},
              )
            ],

          ),
          body: Stack(
            children: <Widget>[
              _bodyContent(context),
              _profileImage(context),
            ],
          ),
        )


      ],
    );
  }

  Widget _bodyContent(BuildContext context) {
    return Positioned(
      left: 16,
      right: 16,
      top: MediaQuery.of(context).size.height * 0.07,
      bottom: 0,
      child: Container(
        padding: EdgeInsets.only(top: 75),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )
        ),
        child: ListView(
          children: <Widget>[
            Text(
                _profile.user.name,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 28,
                  color: _textColor
                ),
                textAlign: TextAlign.center,
            ),
            Padding(
              padding:  EdgeInsets.only(top: 16 , bottom: 24),
              child: Text(
                  _profile.user.address,
                style: TextStyle(
                  color: _textColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
                child: _followButton(context),
                padding: EdgeInsets.only(bottom: 24),
            ),
            _divider(context),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16),
              child: _counters(context),
            ),
            _divider(context),
            ... _restOfContent(context)


          ],
        ),
      ),
    );
  }


  List<Widget> _restOfContent(BuildContext context ){
    return
        [
          Padding(
            padding: EdgeInsets.all(24),
            child: Text(
              "PHOTOS (${_profile.friends.toString()})",
              style: TextStyle(
                color: _textColor,
                fontWeight: FontWeight.bold,

              ),
            ),
          ),
          AnimatedOpacity(
              duration:Duration(milliseconds: 1000) ,
              opacity: _visible2 ? 1 : 0,
              child: _photos(context)
          ),
          ... _aboutMe(context),
          _friends(context),
          AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            opacity:  _visible2 ? 1 : 0,
            child: _contacts(context)
            ,
          )
        ];
  }

  Widget _profileImage(BuildContext context){
    double finalPosition = MediaQuery.of(context).size.height * 0.07 -50;
    double startPosition =MediaQuery.of(context).size.height * 0.07 -75;

    return AnimatedPositioned(
      duration: Duration(milliseconds: 1000),
      top:_visible ? finalPosition : startPosition,
      left: MediaQuery.of(context).size.width/2 -50,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        opacity: _visible ? 1 : 0,
        child: Container(
          width: 100,
          height: 100,
          decoration:BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage("assets/shared/yosri.jpg"),
              fit: BoxFit.cover
            ),
            shape: BoxShape.circle
          ) ,
        ),
      ),

    );
  }

  Color _buttonColor = Color(0xFFf05522);

  Widget _followButton(BuildContext context) {

    return Align(
      child: FlatButton(
        color: _buttonColor,
        onPressed: (){},
        child: AnimatedPadding(
          duration: Duration(milliseconds: 1000),
          padding: EdgeInsets.symmetric(horizontal: _visible ? 16 : 2 ,vertical: 8),
          child: Text(
              "FOLLOW",
              style: TextStyle(
                color: Colors.white
              ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25)
          )
        ),
      ),
    );
  }
  Widget _divider(BuildContext context) {
    return Container(
      height: 1,
      color: Colors.grey.shade200,
    );
  }
  TextStyle _bottomBarTitle = TextStyle(
    color: Colors.grey.shade400,
  );

  TextStyle _bottomBarCounter = TextStyle(
      color: _textColor,
      fontSize: 22,
      fontWeight: FontWeight.bold
  );
  Widget _counters(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                  'FOLLOWERS' ,
                  style: _bottomBarTitle
              ),
              SizedBox(height: 8,),
              Text(
                _profile.followers.toString(),
                style: _bottomBarCounter,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                'FOLLOWING',
                style: _bottomBarTitle,
              ),
              SizedBox(height: 8,),

              Text(
                _profile.following.toString(),
                style: _bottomBarCounter,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                'FRIENDS',
                style: _bottomBarTitle,
              ),
              SizedBox(height: 8,),

              Text(
                _profile.friends.toString(),
                style: _bottomBarCounter,

              ),
            ],
          )
        ],
      ),
    );

  }

  Widget _photos(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 24),
      height: 125,
      child: ListView(

        scrollDirection: Axis.horizontal,
        children: List.generate(_profile.photos, (index){
          return Container(
            width: 125,
            height: 125,
            margin: EdgeInsets.only( right: 16),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/profiles/landscape.jpg'),
                fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10)
              )
            ),
          );
          }).toList()

      ),
    );
  }

  List <Widget> _aboutMe(BuildContext context) {
    return [

      Padding(
        padding: EdgeInsets.symmetric(vertical:24 ,horizontal: 24 ),
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 500),
          opacity: _visible2 ? 1 :0,
          child: Text(
            'ABOUT ME',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: _textColor,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.1
            ),
          ),
        ),
      ),
      Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24),
        child: Text(
          _profile.user.about,
          style: TextStyle(
              color: _textColor,
              fontSize: 16,
              height: 1.1,
              letterSpacing: 1.2
          ),
        ),
      ),


    ];
  }
  Widget _friends(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Text(
        "FRIENDS (${_profile.friends.toString()}) ",
      ),
    );
  }
  Widget _contacts(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: EdgeInsets.only(left: 24,),

      child: ListView(

        scrollDirection: Axis.horizontal,
        children: List.generate(25, (index){
          return Padding(
            padding: EdgeInsets.only(left: 4,right: 8),
            child: Container(
              width: 50,
              height: 50,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: ExactAssetImage(
                        'assets/shared/yosri.jpg'
                    ),
                    fit: BoxFit.cover
                ),
              ),
            ),
          );
        }).toList() ,
      ),
    );
  }




}
