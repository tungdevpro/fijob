import 'package:flutter/services.dart';

void copyToClipboard([String? data]) {
  if (data == null || data == "") return;
  Clipboard.setData(ClipboardData(text: data));
}

String normalizeString(String username) => username.toLowerCase();
