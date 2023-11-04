import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yh_basic/common/extensions/context.dart';

class PopupConfirm extends StatelessWidget {
  final String content;
  final bool hasMarginBottom;

  const PopupConfirm({Key? key, required this.content, this.hasMarginBottom = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: context.hideKeyboard,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              padding: const EdgeInsets.only(
                left: _PopupConstants.padding,
                top: (_PopupConstants.padding),
                right: _PopupConstants.padding,
              ),
              margin: const EdgeInsets.only(top: _PopupConstants.avatarRadius),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(content),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: _Button(
                        title: 'Hủy',
                        onTap: () => _onCancel(context),
                      )),
                      const SizedBox(width: 12),
                      Expanded(
                          child: _Button(
                        title: 'Cài đặt',
                        titleColor: Colors.white,
                        color: const Color(0xff3498db),
                        border: Border.all(color: Colors.transparent),
                        onTap: () => _onGoToSetting(context),
                      )),
                    ],
                  ),
                  if (hasMarginBottom) const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onCancel(BuildContext context) => Navigator.of(context).pop();

  void _onGoToSetting(BuildContext context) {
    Navigator.of(context).pop();
    openAppSettings();
  }
}

class _PopupConstants {
  _PopupConstants._();

  static const double padding = 20;
  static const double avatarRadius = 45;
}

class _Button extends StatelessWidget {
  final dynamic title;
  final VoidCallback? onTap;
  final Color? color;
  final Color? titleColor;
  final Border? border;
  final double? radius;
  final double? width;
  final EdgeInsets? padding;

  const _Button({Key? key, required this.title, this.onTap, this.color, this.border, this.radius, this.width, this.padding, this.titleColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        alignment: Alignment.center,
        padding: padding ?? const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: border ?? Border.all(color: Colors.black.withOpacity(.32)),
          color: color,
        ),
        child: title is Widget ? title : Text(title, style: TextStyle(fontSize: 14, color: titleColor)),
      ),
    );
  }
}
