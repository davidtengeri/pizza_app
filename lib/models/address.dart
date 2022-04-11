import 'package:floor/floor.dart';
import 'package:quiver/core.dart';

@entity
class Address {
  @primaryKey
  int? id;
  String city;
  String street;
  String houseNumber;

  Address({
    this.id,
    required this.city,
    required this.street,
    required this.houseNumber,
  });

  @override
  bool operator ==(Object value) =>
      value is Address &&
      value.city == city &&
      value.street == street &&
      value.houseNumber == houseNumber;

  @override
  int get hashCode => hash3(city, street, houseNumber);
}
