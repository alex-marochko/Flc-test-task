import 'package:flc_test_task/app/main_cubit.dart';
import 'package:flc_test_task/ui/app_mode_page.dart';
import 'package:flc_test_task/ui/birth_date_page.dart';
import 'package:flc_test_task/ui/results_page.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  init();
  runApp(BlocProvider(
      create: (BuildContext context) => MainCubit(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  List<Page> onGeneratePages(MainState state, List<Page> pages) {
    final hasData = state is MainStateLoaded;
    final hasAppMode = hasData && state.userData.appMode != null;
    final hasAllData = hasAppMode && state.userData.birthYear != null;

    return [
      AppModePage.page(),
      if (hasAppMode) BirthDatePage.page(),
      if (hasAllData) ResultsPage.page(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flora',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: FlowBuilder(
        state: context.watch<MainCubit>().state,
        onGeneratePages: onGeneratePages,
      ),
    );
  }
}

void init() {
  // We have necessary fonts in assets
  GoogleFonts.config.allowRuntimeFetching = false;

  // Licensing Fonts
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
}
