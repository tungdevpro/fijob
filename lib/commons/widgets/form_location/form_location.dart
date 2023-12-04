import 'package:fijob/commons/widgets/form_location/bloc/form_location_bloc.dart';
import 'package:fijob/di/di.dart';
import 'package:flutter/material.dart';
import 'package:yh_basic/yh_basic.dart';

import '../../../presentation/shared/custom_input_field.dart';

class FormLocation extends StatefulWidget {
  const FormLocation({super.key});

  factory FormLocation.screen() {
    return const FormLocation();
  }

  @override
  State<FormLocation> createState() => _FormLocationState();
}

class _FormLocationState extends BaseStateView<FormLocation, FormLocationBloc> {
  @override
  FormLocationBloc get initBloc => getIt<FormLocationBloc>()..init();

  @override
  Widget buildChild() {
    return CustomInputField(
      onTap: bloc.onDisplay,
      label: "Country",
      hintText: "Select a country",
      readOnly: true,
    );
  }
}
