import 'package:hive/hive.dart';

import 'address.dart';

part 'profile.g.dart';

@HiveType(typeId: 2)
class Profile extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? phone;
  @HiveField(3)
  String? email;
  @HiveField(4)
  List<Address> addresses = [];
}
