import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:pizza_app/db/address_dao.dart';
import 'package:pizza_app/db/profile_dao.dart';
import 'package:pizza_app/models/address.dart';
import 'package:pizza_app/models/profile.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [Profile, Address])
abstract class AppDatabase extends FloorDatabase {
  ProfileDao get profileDao;
  AddressDao get addressDao;
}
