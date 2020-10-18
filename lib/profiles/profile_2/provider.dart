import 'profile.dart';

class ProfileProvider {
  static Profile getProfile() {
    return Profile(
      user: User(
          name: 'Erick Walters',
          address: '677 Adams Bypass',
          about:
              "I am an energetic, ambitious person who has developed a mature and responsible approach to any task that I undertake, or situation that I am presented with. As a graduate with three years’ experience in management, I am excellent in working with others to achieve a certain objective on time and with excellence."
              " In my previous role, I improved the performance, operations and productivity of my team by 35%."),
      following: 364,
      followers: 2318,
      friends: 25,

    );
  }
}
