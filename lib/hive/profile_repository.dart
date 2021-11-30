import 'package:hive_flutter/hive_flutter.dart';
import 'package:pizza_app/hive/profile.dart';

class ProfileRepository {
  Profile get profile =>
      Hive.box<Profile>('profile').get('profile') ?? Profile();

  void update(Profile profile) {
    Hive.box<Profile>('profile').put('profile', profile);
  }
}
