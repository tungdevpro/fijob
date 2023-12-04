import 'package:fijob/commons/constants/app_dimens.dart';
import 'package:fijob/commons/constants/app_typography.dart';
import 'package:fijob/commons/constants/asset/icon_resource.dart';
import 'package:fijob/commons/constants/color_constant.dart';
import 'package:fijob/commons/widgets/form_location/bloc/form_location_bloc.dart';
import 'package:fijob/commons/widgets/form_location/bloc/form_location_event.dart';
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
      color: Colors.white,
      child: ViewStateBuilder<FormLocationBloc>(
        onLoading: (context, data) => const CircularProgressIndicator(),
        onError: (context, error) => Text('err: $error'),
        onSuccess: (context, data) {
          final items = data as List<LocationModel>;
          return BaseRefreshView(
            enablePullDown: false,
            itemCount: items.length,
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSM, vertical: Dimensions.paddingLG),
            itemBuilder: (context, index) {
              final item = items[index];
              return InkWell(
                onTap: () => _onTap(context, item),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.padding).copyWith(bottom: Dimensions.paddingXXL),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SvgAsset(IconResource.icCheck),
                      const SizedBox(width: Dimensions.paddingLG),
                      Text("${item.name}",
                          style:
                              const TextStyle(fontSize: AppTypography.largeFs, fontWeight: FontWeight.bold, color: ColorConstants.gray100)),
                    ],
                  ),
                ),
              );
            },
            refresh: context.watch<FormLocationBloc>().refreshController,
          );
        },
      ),
    );
  }

  void _onTap(BuildContext context, LocationModel item) {
    context.read<FormLocationBloc>().add(FormLocationSelectedEvent(item: item));
  }
}
