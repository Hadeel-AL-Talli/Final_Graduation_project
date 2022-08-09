import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbController{
  static final DbController _instance = DbController._internal();
  late Database _database;
  DbController._internal();

  factory DbController() {
    return _instance;
  }
  Database get database => _database;



  Future<void> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'cartproduct_db.sql');
    _database = await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('CREATE TABLE cart ('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'nameAr TEXT NOT NULL,'
            'nameEn TEXT NOT NULL,'
            'image_url TEXT NOT NULL,'
            'infoAr TEXT NOT NULL,'
            'infoEn TEXT NOT NULL,'
            'price REAL NOT NULL,'
            'quantity INT'
            ')');
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) {},
      onDowngrade: (db, oldVersion, newVersion) {},
    );
  }
}