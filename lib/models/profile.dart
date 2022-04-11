import 'package:floor/floor.dart';
import 'package:pizza_app/models/address.dart';

@Entity(tableName: 'profile')
class Profile {
  @primaryKey
  int? id;
  String? name;
  String? phone;
  String? email;

  @ignore
  List<Address> addresses = [];

  Profile([this.id, this.name, this.phone, this.email]);

  void addAddress(Address address) {
    addresses.add(address);
  }

  void removeAddress(Address address) {
    addresses.remove(address);
  }
}
