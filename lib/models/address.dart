import 'package:quiver/core.dart';

class Address {
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

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{
      'city': city,
      'street': street,
      'houseNumber': houseNumber,
    };
    if (id != null) {
      map['id'] = id!;
    }
    return map;
  }
}
