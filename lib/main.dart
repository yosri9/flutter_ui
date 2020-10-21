import 'package:flutter/material.dart';
import 'package:flutterui/profiles/profile5/profile5.dart';
import 'package:flutterui/profiles/profiles_4/profile4.dart';

import 'profiles/profile_1/profile_1.dart';
import 'profiles/profile_2/profile2.dart';
import 'profiles/profiles_3/profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Profile5(),
    );
  }
}


