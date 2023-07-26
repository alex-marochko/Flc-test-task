import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app/main_cubit.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  static const routeName = '/result';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                        (state as MainStateLoaded).userData.appMode.toString(),
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
    );
  }
}
