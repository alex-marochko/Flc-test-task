import 'package:flc_test_task/app/main_cubit.dart';
import 'package:flc_test_task/ui/loading_page.dart';
import 'package:flc_test_task/ui/result_page.dart';
import 'package:flutter/material.dart';

import '../domain/user_data.dart';
import 'birth_date_page.dart';
import 'choice_page.dart';

void navigate(BuildContext context, MainState state) {
  if (state is MainStateLoaded) {
    switch (state.userData.stage) {
      case RegistrationStage.appMode:
        Navigator.of(context).pushNamed(ChoicePage.routeName);
        break;
      case RegistrationStage.birthYear:
        Navigator.of(context).pushNamed(BirthDatePage.routeName);
        break;
      case RegistrationStage.results:
        Navigator.of(context).pushNamed(ResultPage.routeName);
        break;
      default:
        Navigator.of(context).pushNamed(LoadingPage.routeName);
    }
  } else {
    Navigator.of(context).pushNamed(LoadingPage.routeName);
  }
}
