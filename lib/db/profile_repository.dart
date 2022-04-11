import 'package:pizza_app/db/app_database.dart';
import 'package:pizza_app/models/address.dart';
import 'package:pizza_app/models/profile.dart';

class ProfileRepository {
  final AppDatabase database;

  ProfileRepository({
    required this.database,
  });

  Future<Profile> load() async {
    Profile? profile = await database.profileDao.load() ?? Profile();
    profile.addresses.addAll(await database.addressDao.loadAllAdresses());
    return profile;
  }

  Future<void> save(Profile profile) async {
    profile.id = await database.profileDao.save(profile);
    await database.addressDao
        .deleteAll(await database.addressDao.loadAllAdresses());

    await database.addressDao.addAddresses(profile.addresses);
  }

  Future<void> addAddress(Address address) async {
    address.id = await database.addressDao.addAddress(address);
  }
}
