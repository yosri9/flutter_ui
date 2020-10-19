import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterui/profiles/profile_2/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'provider.dart';
import 'profile.dart';

class Profile2 extends StatefulWidget {
  @override
  _Profile2State createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {
  Profile _profile = ProfileProvider.getProfile();
  static Color _textColor = Color(0xFF4e4e4e);
  bool _visible = false;
  bool _visible2 = false;

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 500) , (){
      setState(() {
        _visible = true;
      });
    }).then((value){
      setState(() {
        _visible2 = true;
      });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(),
      child: Stack(
        children: <Widget>[
          Image.asset(
            'assets/profiles/profile_2.jpg',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.42,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {},
                icon: Icon(FontAwesomeIcons.bars),
              ),
            ),
            body: Stack(
              children: <Widget>[
                _profileTitle(context),
                 _bodyContent(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileTitle(BuildContext context) {
    return Positioned(
      top: 15,
      right: 0,
      left: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 135,
                  height: 135,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      shape: BoxShape.circle),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 115,
                  height: 115,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      shape: BoxShape.circle),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: AnimatedOpacity(
                  opacity: _visible ? 1 : 0,
                  duration: Duration(milliseconds: 1000),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: ExactAssetImage('assets/shared/yosri.jpg'),
                            fit: BoxFit.cover)),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              _profile.user.name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.4
              ),
            ),
          ),
          Text(
            _profile.user.address,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
            ),
          )
        ],
      ),
    );
  }

  Widget _bodyContent(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.3,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        color: Colors.white,
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _counters(context),
            _divider(context),
            ... _aboutMe(context),
           _friends(context),
            SizedBox(height: 16),
            _contacts(context),


          ],
        ),
      ),
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
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 1000),
        opacity: _visible ? 1 : 0,
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
      ),
    );

 }

  Widget _divider(BuildContext context) {
   return Container(
     height: 1,
     color: Colors.grey.shade200,
   );
  }

 List <Widget> _aboutMe(BuildContext context) {
   return [

     Padding(
       padding: EdgeInsets.symmetric(vertical:16 ,horizontal: 16 ),
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
     Padding(
       padding:  EdgeInsets.symmetric(horizontal: 16),
       child: Text(
       _profile.user.about,
         style: TextStyle(
           color: _textColor,
           fontSize: 17,
           height: 1.1,
           letterSpacing: 1.2
         ),
   ),
     ),


   ];
 }

  Widget _friends(BuildContext context) {
   return Padding(
     padding: const EdgeInsets.all(16),
     child: Text(
      "FRIENDS (${_profile.friends.toString()}) ",
     ),
   );
  }

 Widget _contacts(BuildContext context) {
   return Container(
     width: double.infinity,
     height: 50,
     padding: EdgeInsets.only(left: 16,),

     child: ListView(

       scrollDirection: Axis.horizontal,
       children: List.generate(25, (index){
         return Padding(
           padding: EdgeInsets.only(left: 16,right: 8),
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
