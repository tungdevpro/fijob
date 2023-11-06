import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'base_refresh_controller.dart';

class BaseRefreshView extends StatelessWidget {
  final BaseRefreshController refresh;
  final VoidCallback? onRefresh;
  final VoidCallback? onLoading;
  final NullableIndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final ScrollPhysics? physics;
  final EdgeInsets? padding;
  final ScrollController? scrollController;
  final IndexedWidgetBuilder? separatorBuilder;
  final bool enablePullDown;

  const BaseRefreshView({
    super.key,
    required this.refresh,
    this.onRefresh,
    this.onLoading,
    required this.itemBuilder,
    this.itemCount = 0,
    this.physics,
    this.padding,
    this.scrollController,
    this.separatorBuilder,
    this.enablePullDown = true,
  });

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      physics: physics ?? const ClampingScrollPhysics(),
      enablePullDown: enablePullDown,
      enablePullUp: refresh.isEndpoint,
      header: const ClassicHeader(),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus? mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = const Text("pull up load");
          } else if (mode == LoadStatus.loading) {
            body = const CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = const Text("Load Failed!Click retry!");
          } else if (mode == LoadStatus.canLoading) {
            body = const Text("release to load more");
          } else {
            body = const Text("No more Data");
          }
          return SizedBox(height: 55.0, child: Center(child: body));
        },
      ),
      controller: refresh.controller,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: ListView.separated(
        itemCount: itemCount,
        physics: physics ?? const ClampingScrollPhysics(),
        padding: padding,
        controller: scrollController,
        separatorBuilder: separatorBuilder ?? (_, __) => const SizedBox.shrink(),
        itemBuilder: itemBuilder,
      ),
    );
  }

  void _onRefresh() {
    // refresh.onRefresh();
    onRefresh?.call();
  }

  void _onLoading() {
    // refresh.onLoadMore();
    onLoading?.call();
  }
}
