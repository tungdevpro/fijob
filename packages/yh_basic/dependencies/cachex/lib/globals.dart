import 'package:flutter/cupertino.dart';

@immutable
abstract class Globals {
  const Globals._();

  static const int currentVersionDatabase = 3;
  static const int defaultDurationDay = 7;

  static const String tableName = "caches";
  static const String colKey = "key";
  static const String colMaxDate = "max_date";
  static const String colContent = "content";
  static const String colStatusCode = "status_code";

  static const String rawGenerateSQL = """
  CREATE TABLE IF NOT EXISTS $tableName (
    $colKey text,
    $colMaxDate integer,
    $colContent text,
    $colStatusCode integer,
    PRIMARY KEY ($colKey)
  )
  """;
}