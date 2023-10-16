import 'package:hive_flutter/hive_flutter.dart';
import 'package:yh_basic/yh_basic.dart';

class HiveInitializer implements LibraryInitializer {
  @override
  Future<void> init() async {
    await Hive.initFlutter();
  }
}
