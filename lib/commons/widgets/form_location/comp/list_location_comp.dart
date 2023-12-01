import 'package:fijob/commons/widgets/form_location/bloc/form_location_bloc.dart';
import 'package:fijob/data/models/location_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yh_basic/yh_basic.dart';

class ListLocationComp extends StatelessWidget {
  const ListLocationComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(height: double.infinity),
      child: ViewStateBuilder<FormLocationBloc>(
        onLoading: (context, data) => const CircularProgressIndicator(),
        onError: (context, error) => Text('err: $error'),
        onSuccess: (context, data) {
          final items = data as List<LocationModel>;
          return BaseRefreshView(
            enablePullDown: false,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Card(
                child: ListTile(
                  title: Text("${item.name}"),
                ),
              );
            },
            refresh: context.watch<FormLocationBloc>().refreshController,
          );
        },
      ),
    );
  }
}
