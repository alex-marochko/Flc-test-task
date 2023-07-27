import 'package:flc_test_task/ui/tools/custom_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app/main_cubit.dart';

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
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(children: [
            Center(
                child: BlocBuilder<MainCubit, MainState>(
              buildWhen: (oldSTate, newState) => newState is MainStateLoaded,
              builder: (context, state) {
                return Column(mainAxisSize: MainAxisSize.min, children: [
                  Card(
                    child: SizedBox(
                      width: 300,
                      child: ListTile(
                        title: const Text('Selected mode:'),
                        subtitle: Text(
                          (state as MainStateLoaded)
                              .userData
                              .appMode
                              .toString(),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: SizedBox(
                      width: 300,
                      child: ListTile(
                        title: const Text('Selected year:'),
                        subtitle: Text((state).userData.birthYear.toString()),
                      ),
                    ),
                  )
                ]);
              },
            ))
          ]),
        ),
      ),
    );
  }
}
