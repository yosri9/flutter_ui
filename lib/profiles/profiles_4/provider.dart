
import 'package:flutterui/profiles/profiles_4/profile.dart';

class ProfileProvider{
  static Profile getProfile(){
    return Profile(
      user: User(
        name: 'Erick walters' ,
        profession: 'Photography',
        about: 'Published wedding, beauty, fashion, portrait photographer and retoucher.'
      ),
      following: 364,
      followers: 2318,
      friends: 175
    );
  }
}