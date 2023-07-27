import 'package:flc_test_task/ui/tools/custom_page.dart';
import 'package:flc_test_task/ui/widgets/decorations.dart';
import 'package:flc_test_task/ui/widgets/option_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app/main_cubit.dart';
import '../domain/user_data.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  static Page page() {
    return const CustomPage<void>(
      child: ResultsPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<MainCubit>().selectYear(null);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(children: [
            ...decorations,
            Center(
                child: BlocBuilder<MainCubit, MainState>(
              buildWhen: (oldSTate, newState) => newState is MainStateLoaded,
              builder: (context, state) {
                final String mode =
                    switch ((state as MainStateLoaded).userData.appMode) {
                  AppMode.periodTracking => 'period tracking',
                  AppMode.getPregnant => 'get pregnant',
                  _ => ''
                };

                return Column(mainAxisSize: MainAxisSize.min, children: [
                  OptionCard(
                    title: 'App Mode',
                    showArrow: false,
                    subtitle: mode,
                  ),
                  const SizedBox(height: 20),
                  OptionCard(
                      title: 'Year of Birth',
                      showArrow: false,
                      subtitle: (state).userData.birthYear.toString()),
                ]);
              },
            ))
          ]),
        ),
      ),
    );
  }
}
