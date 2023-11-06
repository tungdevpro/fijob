import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'argument.dart';
import 'behavior.dart';

class BaseRefreshController implements BaseListBehavior {
  final RefreshController controller;
  final Function handler;

  BaseRefreshController(this.controller, {RefreshParameter? param, required this.handler})
      : _page = param?.page ?? 1,
        _isEndpoint = param?.isEndpoint ?? false;

  int _page = 1;

  int get page => _page;

  bool _isEndpoint = false;

  bool get isEndpoint => _isEndpoint;

  @protected
  void _resetValue() {
    _page = 1;
    _isEndpoint = false;
  }

  void setPage(int input) {
    _page = input;
  }

  void setEndpoint(bool input) {
    _isEndpoint = input;
  }

  @override
  void onRefresh() async {
    _resetValue();
    await handler.call();
    controller.resetNoData();
    controller.refreshCompleted();
  }

  @override
  void onLoadMore() async {
    _page++;
    await handler.call();
    controller.loadComplete();
    if (_isEndpoint) controller.loadNoData();
  }

  @override
  void onClose() {
    controller.dispose();
  }
}
