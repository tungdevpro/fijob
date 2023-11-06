import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  final RefreshController refreshController;
  final VoidCallback? onRefresh;
  final VoidCallback? onLoading;

  const MainLayout({super.key, required this.child, required this.refreshController, this.onRefresh, this.onLoading});

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      physics: const ClampingScrollPhysics(),
      enablePullDown: true,
      enablePullUp: true,
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
          return SizedBox(
              height: 55.0,
              child: Center(child: body)
          );
        },
      ),
      controller: refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: child,
    );
  }

  void _onRefresh() {
    onRefresh?.call();
    refreshController.refreshCompleted();
  }

  void _onLoading() {
    onLoading?.call();
  }
}
