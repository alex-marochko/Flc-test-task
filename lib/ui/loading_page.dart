import 'package:flc_test_task/app/main_cubit.dart';
import 'package:flc_test_task/ui/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingPage extends StatelessWidget {
  static const routeName = '/';

  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BlocListener<MainCubit, MainState>(
      listener: navigate,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
