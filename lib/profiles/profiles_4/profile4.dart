import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterui/profiles/profiles_4/profile.dart';
import 'package:flutterui/profiles/profiles_4/provider.dart';

class Profile4 extends StatefulWidget {
  @override
  _Profile4State createState() => _Profile4State();
}

class _Profile4State extends State<Profile4> {
  Profile _profile = ProfileProvider.getProfile();
  static Color _textColor = Color(0xFF4e4e4e);
  bool _visible = false;
  bool _visible2 = false;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2) , (){
    setState(() {
      _visible = true ;
    });
    }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/profiles/profile_4.jpeg',
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
          ),
          body: Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedOpacity(
              child: _bodyCard(context),
              opacity: _visible ? 1 : 0,
              duration: Duration(seconds: 1),
            ),
          ),
        )
      ],
    );
  }

  Widget _bodyCard(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      height: MediaQuery.of(context).size.height * 0.45,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _profileRow(context),
          ..._profileText(context),
          Spacer(
            flex: 2,
          ),
          _divider(context),
          _counters(context),
        ],
      ),
    );
  }

  TextStyle _bottomBarTitle = TextStyle(
    color: Colors.grey.shade400,
  );

  TextStyle _bottomBarCounter =
      TextStyle(color: _textColor, fontSize: 22, fontWeight: FontWeight.bold);

  Widget _counters(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text('FOLLOWERS', style: _bottomBarTitle),
              SizedBox(
                height: 8,
              ),
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
              SizedBox(
                height: 8,
              ),
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
              SizedBox(
                height: 8,
              ),
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

  Widget _divider(BuildContext context) {
    return Container(
      height: 1,
      color: Colors.grey.shade200,
    );
  }

  Widget _profileRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage('assets/shared/yosri.jpg')),
                shape: BoxShape.circle),
          ),
          Spacer(
            flex: 30,
          ),
          RaisedButton(
            child: Text('ADD FRIEND'),
            onPressed: () {},
            color: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: _textColor, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(25))),
          ),
          SizedBox(
            width: 16,
          ),
          RaisedButton(
            child: Text(
              'FOLLOW',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {},
            color: _textColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25))),
          ),
        ],
      ),
    );
  }

  List<Widget> _profileText(BuildContext context) {
    return [
      Padding(
        padding: EdgeInsets.only(left: 16, bottom: 8),
        child: Text(
          _profile.user.name,
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 30, color: _textColor),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 16, bottom: 16),
        child: Text(
          _profile.user.profession,
          style: TextStyle(color: Colors.grey.shade400),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          _profile.user.about,
          style:
              TextStyle(color: _textColor, fontSize: 18, letterSpacing: 1.05),
        ),
      ),
    ];
  }
}
