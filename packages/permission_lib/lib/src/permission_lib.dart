import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:permission_lib/src/popup_confirm.dart';
import 'package:yh_basic/navigator/app_navigator.dart';

class PermissionLib {
  PermissionLib._internal();

  static PermissionLib? _instance;

  factory PermissionLib.instance() => _instance ??= PermissionLib._internal();

  Future<bool> requests(List<Permission> permissions) async {
    List<String> requestTitle = [];
    final Map<Permission, PermissionStatus> status = await permissions.request();
    bool result = true;
    await Future.forEach(status.entries, (MapEntry element) {
      if (element.value != PermissionStatus.granted) {
        requestTitle.add(_getRequestTitle(element.key));
        result = false;
      }
    }).then((value) {
        if (requestTitle.isNotEmpty && AppNavigator.navigatorKey.currentState != null) {
          showDialog(
              context: AppNavigator.navigatorKey.currentState!.context,
              barrierColor: Colors.transparent,
              builder: (context) => PopupConfirm(content: 'Bạn cần cấp quyền truy cập ${requestTitle.join(', ')} để tiếp tục'));
        }
    });
    return result;
  }

  String _getRequestTitle(Permission permission) {
    switch (permission.toString()) {
      case 'Permission.storage':
        return 'Bộ nhớ';
      case 'Permission.camera':
        return 'Camera';
      case 'Permission.notification':
        return 'Thông báo';
      case 'Permission.location':
        return 'Vị trí';
      case 'Permission.phone':
        return 'Danh bạ';
      case 'Permission.photos':
        return 'Thư viện';
      case 'Permission.microphone':
        return 'Microphone';
      default:
        return '';
    }
  }
}
