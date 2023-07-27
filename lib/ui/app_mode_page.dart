import 'dart:developer';

import 'package:flc_test_task/app/main_cubit.dart';
import 'package:flc_test_task/domain/user_data.dart';
import 'package:flc_test_task/ui/tools/custom_page.dart';
import 'package:flc_test_task/ui/widgets/option_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppModePage extends StatelessWidget {
  const AppModePage({super.key});

  static Page page() {
    return const CustomPage<void>(
      child: AppModePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/curve_1_1.png',
              width: 171,
            ),
            Positioned(
              left: 67,
              top: 624,
              child: Image.asset(
                'assets/curve_1_3a.png',
                width: 138,
              ),
            ),
            Positioned(
              left: 141,
              top: 624,
              child: Image.asset(
                'assets/curve_1_3b.png',
                width: 64,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                'assets/curve_1_2.png',
                width: 70,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 253),
                  OptionCard(
                      title: 'Track my period',
                      subtitle: 'contraception and wellbeing',
                      onTap: () {
                        log('Track my period - pressed');
                        context
                            .read<MainCubit>()
                            .selectMode(AppMode.periodTracking);
                      }),
                  const SizedBox(height: 73),
                  OptionCard(
                      title: 'Get pregnant',
                      subtitle: 'learn about reproductive health',
                      onTap: () {
                        log('Get pregnant - pressed');
                        context
                            .read<MainCubit>()
                            .selectMode(AppMode.getPregnant);
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
