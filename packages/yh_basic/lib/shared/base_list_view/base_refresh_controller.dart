import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'argument.dart';
import 'behavior.dart';

class BaseRefreshController implements BaseListBehavior {
  final RefreshController controller;

  BaseRefreshController(this.controller, {RefreshParameter? param}) : page = param?.page ?? 1;

  int page = 1;
  bool isEndpoint = false;

  void setPage(int input) {
    page = input;
  }

  void setEndpoint(bool input) {
    isEndpoint = input;
  }

  @override
  void onRefresh() {}

  @override
  void onClose() {
    controller.dispose();
  }

  @override
  void onLoadData() {}

  @override
  void onLoadMore() {}
}
