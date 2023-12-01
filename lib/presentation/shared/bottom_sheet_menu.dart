import 'package:flutter/material.dart';
import 'package:yh_basic/yh_basic.dart';

class BottomSheetMenu extends StatelessWidget {
  final Widget? child;
  final Widget? bottom;
  final dynamic title;
  final Widget? actionRight;
  final Widget? actionLeft;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  const BottomSheetMenu(
      {Key? key, this.title, this.child, this.bottom, this.actionRight, this.actionLeft, this.backgroundColor, this.padding})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12),
      child: SafeArea(
        bottom: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (title != null)
              Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.0, color: const Color(0xffF1F1F1).withOpacity(0.5)))),
                child: Row(
                  children: <Widget>[
                    if (actionLeft != null) actionLeft!,
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: Center(
                          child: title is Widget
                              ? title
                              : Text('$title',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    if (actionRight != null) actionRight!
                  ],
                ),
              ),
            if (child != null) Flexible(child: child!),
            if (bottom != null) bottom!,
          ],
        ),
      ),
    );
  }
}
