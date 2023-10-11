import 'package:flutter/material.dart';

@immutable
abstract class LibraryInitializer {
  Future<void> init();
}

