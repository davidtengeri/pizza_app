import 'package:hive/hive.dart';

part 'address.g.dart';

@HiveType(typeId: 1)
class Address extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String city;
  @HiveField(2)
  String street;
  @HiveField(3)
  String houseNumber;

  Address({
    this.id,
    required this.city,
    required this.street,
    required this.houseNumber,
  });
}
