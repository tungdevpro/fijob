import 'dart:async';
import 'dart:io';

import 'package:cachex/core/cache_store.dart';
import 'package:cachex/models/data_local.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../globals.dart';

class DiskStore extends CacheStore {
  final String dbName;

  Database? _db;

  DiskStore({required this.dbName});

  Future<Database?> get db async {
    if (_db == null) {
      String path = await getDatabasesPath();
      await Directory(path).create(recursive: true);
      path = join(path, "$dbName.db");
      _db = await openDatabase(path, version: Globals.currentVersionDatabase, onCreate: _onCreate, onUpgrade: _onUpgrade);
    }
    return _db;
  }

  @override
  Future<bool> clearAll() {
    throw UnimplementedError();
  }

  @override
  Future<bool> clearExpired() {
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(String key, {String? subKey}) {
    throw UnimplementedError();
  }

  @override
  Future<DataLocal?> getData(String key, {String? subKey}) {
    throw UnimplementedError();
  }

  @override
  Future<bool> setData(DataLocal obj) {
    throw UnimplementedError();
  }

  void _onCreate(Database db, int version) async {
    await db.execute(Globals.rawGenerateSQL);
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {
  }
}
